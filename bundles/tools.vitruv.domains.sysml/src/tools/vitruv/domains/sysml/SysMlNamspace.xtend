package tools.vitruv.domains.sysml

import org.eclipse.uml2.uml.UMLPackage
import org.eclipse.emf.ecore.EPackage
import org.eclipse.papyrus.sysml14.sysmlPackage

final class SysMlNamspace {
	private new() {
	}

	// file extensions
	public static final String FILE_EXTENSION = "uml";

	// MM Namespaces
	public static final EPackage ROOT_PACKAGE = sysmlPackage.eINSTANCE;
	public static final String METAMODEL_NAMESPACE = UMLPackage.eNS_URI;
}