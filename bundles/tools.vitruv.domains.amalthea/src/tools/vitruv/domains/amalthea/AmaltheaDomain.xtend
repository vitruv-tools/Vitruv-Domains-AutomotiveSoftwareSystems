package tools.vitruv.domains.amalthea

import org.eclipse.app4mc.amalthea.model.AmaltheaPackage
import tools.vitruv.framework.domains.AbstractVitruvDomain

class AmaltheaDomain extends AbstractVitruvDomain {
	public static val METAMODEL_NAME = "Amalthea"
	public static val FILE_EXTENSION = "amalthea"
	public static val ROOT_PACKAGE = AmaltheaPackage.eINSTANCE

	package new() {
		super(METAMODEL_NAME, ROOT_PACKAGE, FILE_EXTENSION)
	}

}
