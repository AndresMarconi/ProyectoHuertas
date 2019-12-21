# ProyectoHuertas

```Smalltalk
Metacello new
	baseline: 'ProyectoHuertas';
	repository: 'github://AndresMarconi/ProyectoHuertas';
	onConflictUseLoaded;
	load.
  ```
  
 # Registering the application
 
 The #initialize class method on class FOMHomeComponent registers the application on /huertas
 
 # Database access
 
 Proyecto huertas stores data using mongodb (which can also be  simulated in memory for evaluation and testing).
 
 Look at the class protocol of class FOMStorage for an idea of how to configure persistency. By default, Proyecto huertas works with in-memory presistency. 
 
 # Example data
 
 Take a look at class FOMVoyageExampleLoader to generate some example data.
 
