package tools.vitruv.domains.asem

import org.junit.Test
import org.junit.Assert
import edu.kit.ipd.sdq.metamodels.asem.AsemPackage
import edu.kit.ipd.sdq.metamodels.asem.base.Identifiable
import edu.kit.ipd.sdq.metamodels.asem.base.Named
import edu.kit.ipd.sdq.metamodels.asem.base.BasePackage
import edu.kit.ipd.sdq.metamodels.asem.classifiers.ClassifiersFactory
import edu.kit.ipd.sdq.metamodels.asem.dataexchange.DataexchangeFactory
import edu.kit.ipd.sdq.metamodels.asem.primitivetypes.PrimitivetypesFactory
import org.eclipse.emf.ecore.EObject
import org.junit.Before
import tools.vitruv.framework.tuid.TuidManager
import edu.kit.ipd.sdq.metamodels.asem.classifiers.ComposedType
import edu.kit.ipd.sdq.metamodels.asem.dataexchange.Method
import edu.kit.ipd.sdq.metamodels.asem.dataexchange.Message
import edu.kit.ipd.sdq.metamodels.asem.dataexchange.Parameter
import edu.kit.ipd.sdq.metamodels.asem.dataexchange.ReturnType
import edu.kit.ipd.sdq.metamodels.asem.dataexchange.Variable
import edu.kit.ipd.sdq.metamodels.asem.primitivetypes.BooleanType
import edu.kit.ipd.sdq.metamodels.asem.primitivetypes.ContinuousType
import edu.kit.ipd.sdq.metamodels.asem.primitivetypes.PrimitiveType
import edu.kit.ipd.sdq.metamodels.asem.primitivetypes.SignedDiscreteType
import edu.kit.ipd.sdq.metamodels.asem.primitivetypes.UnsignedDiscreteType

class AsemDomainTest {
	private static val TEST_NAME = "Test";
	private var AsemDomain asemDomain;
	
	@Before
	public def void setup() {
		TuidManager.instance.reinitialize();
		asemDomain = new AsemDomainProvider().domain;
	}
	
	@Test
	public def void testResponsibilityChecks() {
		val clazz = ClassifiersFactory.eINSTANCE.createClass();
		Assert.assertTrue(asemDomain.isInstanceOfDomainMetamodel(clazz));
		Assert.assertTrue(asemDomain.calculateTuid(clazz) !== null);
	}
	
	@Test
	def public void testTuidInClassifiersPackage() {
		testNamedTuid(ClassifiersFactory.eINSTANCE.createClass(), edu.kit.ipd.sdq.metamodels.asem.classifiers.Class.simpleName);
		testNamedTuid(ClassifiersFactory.eINSTANCE.createComposedType(), ComposedType.simpleName);
		testNamedTuid(ClassifiersFactory.eINSTANCE.createModule(), edu.kit.ipd.sdq.metamodels.asem.classifiers.Module.simpleName);
	}
	
	@Test
	def public void testTuidInDataExchangePackage() {
		testNamedTuid(DataexchangeFactory.eINSTANCE.createMethod(), Method.simpleName);
		testNamedTuid(DataexchangeFactory.eINSTANCE.createMessage(), Message.simpleName);
		testNamedTuid(DataexchangeFactory.eINSTANCE.createParameter(), Parameter.simpleName);
		testNamedTuid(DataexchangeFactory.eINSTANCE.createReturnType(), ReturnType.simpleName);
		testNamedTuid(DataexchangeFactory.eINSTANCE.createVariable(), Variable.simpleName);
	}
	
	@Test
	def public void testTuidInPrimitiveTypesPackage() {
		testNamedTuid(PrimitivetypesFactory.eINSTANCE.createBooleanType(), BooleanType.simpleName);
		testNamedTuid(PrimitivetypesFactory.eINSTANCE.createContinuousType(), ContinuousType.simpleName);
		testNamedTuid(PrimitivetypesFactory.eINSTANCE.createPrimitiveType(), PrimitiveType.simpleName);
		testNamedTuid(PrimitivetypesFactory.eINSTANCE.createSignedDiscreteType(), SignedDiscreteType.simpleName);
		testNamedTuid(PrimitivetypesFactory.eINSTANCE.createUnsignedDiscreteType(), UnsignedDiscreteType.simpleName);
	}
	
	private def testNamedTuid(Named named, String typeName) {
		named.name = TEST_NAME;
		testTuid(named, typeName);
	}
	
	private def dispatch testTuid(Identifiable identifiable, String typeName) {
		assertTuid(identifiable, AsemPackage.eNS_URI,  "<root>-_-" + typeName + "-_-" + BasePackage.Literals.IDENTIFIABLE__ID.name + "=" + identifiable.id);
	}

	private def dispatch testTuid(Named named, String typeName) {
		assertTuid(named, AsemPackage.eNS_URI,  "<root>-_-" + typeName + "-_-" + BasePackage.Literals.NAMED__NAME.name + "=" + named.name);
	}

	private def void assertTuid(EObject object, String expectedNamespaceUri, String expectedIdentifier) {
		val tuidFragments = asemDomain.calculateTuid(object).toString.split("#");
		Assert.assertEquals(3, tuidFragments.length);
		Assert.assertEquals(expectedNamespaceUri, tuidFragments.get(0));
		Assert.assertNotNull(tuidFragments.get(1));
		Assert.assertEquals(expectedIdentifier, tuidFragments.get(2));
	}
	
}