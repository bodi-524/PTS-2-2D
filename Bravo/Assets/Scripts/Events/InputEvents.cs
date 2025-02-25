using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class InputEvents
{
    // Event for when the submit button is pressed
    public event Action onSubmitPressed;
    public void SubmitPressed() => onSubmitPressed?.Invoke();
}