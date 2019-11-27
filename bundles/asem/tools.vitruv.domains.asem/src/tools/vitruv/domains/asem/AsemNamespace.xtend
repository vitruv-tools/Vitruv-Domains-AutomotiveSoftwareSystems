package tools.vitruv.domains.asem

import org.eclipse.emf.ecore.EPackage
import edu.kit.ipd.sdq.metamodels.asem.AsemPackage

final class AsemNamespace {
	private new() {
	}

	// file extensions
	public static final String FILE_EXTENSION = "asem";

	// MM Namespaces
	public static final EPackage ROOT_PACKAGE = AsemPackage.eINSTANCE;
	public static final String METAMODEL_NAMESPACE = AsemPackage.eNS_URI;
	
}