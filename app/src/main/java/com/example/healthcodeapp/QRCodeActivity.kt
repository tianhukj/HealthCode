package com.example.healthcodeapp

import android.graphics.Color
import android.os.Bundle
import android.widget.ImageView
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import com.squareup.picasso.Picasso
import okhttp3.OkHttpClient
import okhttp3.Request
import org.json.JSONObject
import java.io.IOException

class QRCodeActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_qrcode)

        val name = intent.getStringExtra("name") ?: ""
        val id = intent.getStringExtra("id") ?: ""
        val qrCodeImageView: ImageView = findViewById(R.id.qrCodeImageView)
        val nameTextView: TextView = findViewById(R.id.nameTextView)
        val idTextView: TextView = findViewById(R.id.idTextView)

        val qrCodeContent = "姓名: $name\n身份证号: $id"
        val qrCodeUrl = "https://api.qrserver.com/v1/create-qr-code/?data=$qrCodeContent"

        Picasso.get().load(qrCodeUrl).into(qrCodeImageView)

        nameTextView.text = "姓名: $name"
        idTextView.text = "身份证号: $id"

        fetchIpAndChangeColor(qrCodeImageView)
    }

    private fun fetchIpAndChangeColor(qrCodeImageView: ImageView) {
        val client = OkHttpClient()
        val request = Request.Builder().url("https://api.ipify.org?format=json").build()

        client.newCall(request).enqueue(object : okhttp3.Callback {
            override fun onFailure(call: okhttp3.Call, e: IOException) {
                // Handle failure
            }

            override fun onResponse(call: okhttp3.Call, response: okhttp3.Response) {
                response.body?.let {
                    val json = JSONObject(it.string())
                    val ip = json.getString("ip")

                    // 调用IP Geolocation API来获取地理位置信息
                    fetchLocationAndChangeColor(ip, qrCodeImageView)
                }
            }
        })
    }

    private fun fetchLocationAndChangeColor(ip: String, qrCodeImageView: ImageView) {
        val client = OkHttpClient()
        val apiKey = "d6a4e2c63e0741c2a942be79efde98fb" // 替换为你的IP Geolocation API Key
        val request = Request.Builder()
            .url("https://api.ipgeolocation.io/ipgeo?apiKey=$apiKey&ip=$ip")
            .build()

        client.newCall(request).enqueue(object : okhttp3.Callback {
            override fun onFailure(call: okhttp3.Call, e: IOException) {
                // Handle failure
            }

            override fun onResponse(call: okhttp3.Call, response: okhttp3.Response) {
                response.body?.let {
                    val json = JSONObject(it.string())
                    val city = json.getString("city")
                    val state = json.getString("state_prov")

                    runOnUiThread {
                        if (city == "Dongying" && state == "Shandong") {
                            qrCodeImageView.setColorFilter(Color.RED)
                        } else {
                            qrCodeImageView.setColorFilter(Color.GREEN)
                        }
                    }
                }
            }
        })
    }
}
