using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class PlayerMovement : MonoBehaviour
{
    public static Rigidbody rb;

    //Level Tracker
    public static int inLvl;

    public float speed;

    // Start is called before the first frame update
    void Start()
    {
        rb = GetComponent<Rigidbody>();
        
    }

    void Update()
    {
        //WASD Controls
        if (Input.GetKey(KeyCode.A))
        {
            rb.AddForce(Vector3.left * speed);
        }
        if (Input.GetKey(KeyCode.D))
        {
            rb.AddForce(Vector3.right * speed);
        }
        if (Input.GetKey(KeyCode.W))
        {
            rb.AddForce(Vector3.up * 10);
        }

     

    }

    void OnCollisionEnter(Collision collision)
    {
        if (collision.gameObject.tag == "BoostPad")
        {
            Debug.Log("dsdsds");
            rb.AddForce(Vector3.forward * 1400);
        }
    }
}
