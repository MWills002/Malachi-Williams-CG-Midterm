using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Cloud : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        transform.Translate(0.05f, 0, 0);

        if (transform.position.x > 2)
        {
            transform.position = new Vector3(-3, 14, -5);
        }
    }
}
