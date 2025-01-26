package com.example.healthcodeapp

import android.content.Intent
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val nameEditText: EditText = findViewById(R.id.nameEditText)
        val idEditText: EditText = findViewById(R.id.idEditText)
        val loginButton: Button = findViewById(R.id.loginButton)
        val errorTextView: TextView = findViewById(R.id.errorTextView)

        loginButton.setOnClickListener {
            val name = nameEditText.text.toString()
            val id = idEditText.text.toString()

            if (name.isEmpty() || id.length != 18 || !id.all { it.isDigit() }) {
                errorTextView.text = "输入有误"
            } else {
                errorTextView.text = ""
                val intent = Intent(this, QRCodeActivity::class.java).apply {
                    putExtra("name", name)
                    putExtra("id", id)
                }
                startActivity(intent)
            }
        }
    }
}
