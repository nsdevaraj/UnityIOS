#pragma strict
import System.Runtime.InteropServices;

@DllImport ("__Internal")
static private function update_game(missed : int, lost : int) : void {};

@DllImport ("__Internal")
static private function end_game(missed : int, lost : int) : void {};
 

var missed : int = 10;
var lost : int = 40;


function updateGame () {
  update_game(missed, lost);
}
function OnGUI(){
	 	
	if(GUI.Button(Rect (Screen.width/1.12,Screen.height/30,80,80), "exit")){
	endGame();
	}
if(GUI.Button(Rect (Screen.width/2.12,Screen.height/20,80,80), "start")){
missed=23;
	updateGame();
	}
}
function endGame () {
  end_game(missed, lost);
}

// Interop

function callFromXcode (message : String) {
  if (message == "switchToCamera") {
    switchToCamera();
  }
  else if (message == "startGame") {
    startGame();
  }
}

// Flow Control

function switchToCamera () {
   Debug.Log("scamers");
}

function startGame () {
   Debug.Log("sgame");
}