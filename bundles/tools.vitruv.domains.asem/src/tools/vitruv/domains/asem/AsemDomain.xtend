package tools.vitruv.domains.asem

import edu.kit.ipd.sdq.metamodels.asem.AsemPackage
import tools.vitruv.framework.domains.AbstractVitruvDomain

class AsemDomain extends AbstractVitruvDomain {
	public static val METAMODEL_NAME = "ASEM"
	public static val FILE_EXTENSION = "asem"
	public static val ROOT_PACKAGE = AsemPackage.eINSTANCE

	package new() {
		super(METAMODEL_NAME, ROOT_PACKAGE, FILE_EXTENSION)
	}

}
