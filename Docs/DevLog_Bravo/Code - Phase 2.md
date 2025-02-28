Starting with Phase 2 . We focus on the remaining parts of the blueprint. 
Having a loose sense of structure of the whole project is certainly advantageous and even if there are changes, its still better than a confused approach in my opinion. 

## <mark style="background: #ADCCFFA6;">UIManager</mark>
The **UIManager** will handle displaying the dialogue text and choices on the screen. **TextMeshPro** for text rendering and **UI Buttons** for choices.


![](Misc/Pasted%20image%2020250226091736.png)

I set up a neat background image and some panels based on the ratio this mockup was designed. These panels will display data based on the scripts. 

I acquired the font asset from [google fonts](https://fonts.google.com/selection?query=pixel+) and utilized it in TextMeshPro but a better pixely feel. 
**Import your font file:**    
- Download a font file (TTF or OTF) from a source like Google Fonts. 
- Drag and drop the font file into your Unity project's Assets folder. 
**Open the Font Asset Creator:**    
- Go to Window > TextMeshPro > Font Asset Creator.     
**Create the font asset:**    
- In the Font Asset Creator window, select your imported font file as the "Source Font File". 
- Adjust settings like "Sampling Point Size" depending on your needs. 
- Click "Generate Font Atlas" to create the texture atlas for your font.     
**Assign the font to your TextMeshPro object:**    
- Select your TextMeshPro GameObject in the Hierarchy. 
- In the Inspector window, navigate to the "Font" property and drag your newly created font asset onto it.
With some custom anchoring. I hope the hard work would pay off when working with different builds. 

Some minor code adjustments to link up the Assets and UI elements with the existing code base. Pretty time consuming to debug. 
