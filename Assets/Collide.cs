using UnityEngine;
using System.Collections;

public class Collide : MonoBehaviour {
	bool crashed;
	Vector3 mLastPosition;
	// Use this for initialization
	void Start () { 
	}
	
	// Update is called once per frame
	void Update () {
		if (crashed) { 
			float speed = (transform.position - this.mLastPosition).magnitude ; 
			Debug.Log(speed + " vel"); 
			this.mLastPosition = transform.position;
		}
		//transform.localScale = new Vector3 ((length / 20), 1, 1);
	}
	
	
	void OnCollisionEnter(Collision collision) {  
	   // foreach (ContactPoint contact  in collision.contacts) {
	      //  Debug.Log(this.gameObject+"crash"+contact);
			crashed = true;
	   // } 
	}
}