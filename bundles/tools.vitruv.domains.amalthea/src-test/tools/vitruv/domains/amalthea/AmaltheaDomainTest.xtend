package tools.vitruv.domains.amalthea

import org.eclipse.emf.ecore.EObject
import tools.vitruv.framework.tuid.TuidManager
import org.eclipse.app4mc.amalthea.model.AmaltheaFactory
import org.eclipse.app4mc.amalthea.model.AmaltheaPackage
import org.eclipse.app4mc.amalthea.model.INamed
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.Test
import static org.junit.jupiter.api.Assertions.assertTrue
import static org.junit.jupiter.api.Assertions.assertEquals
import static org.junit.jupiter.api.Assertions.assertNotNull

class AmaltheaDomainTest {
	static val TEST_NAME = "Test";
	var AmaltheaDomain asemDomain;
	
	@BeforeEach
	def void setup() {
		TuidManager.instance.reinitialize();
		asemDomain = new AmaltheaDomainProvider().domain;
	}
	
	@Test
	def void testResponsibilityChecks() {
		val clazz = AmaltheaFactory.eINSTANCE.createStimulusEvent();
		assertTrue(asemDomain.isInstanceOfDomainMetamodel(clazz));
		assertNotNull(asemDomain.calculateTuid(clazz));
	}
	
	@Test
	def void testNamedTuids() {
		testNamedTuid(AmaltheaFactory.eINSTANCE.createConnector());
	}
	
	private def testNamedTuid(INamed named) {
		named.name = TEST_NAME;
		testTuid(named);
	}
	
	private def testTuid(INamed named) {
		assertTuid(named, AmaltheaPackage.eNS_URI, "<root>-_-" + named.eClass.name + "-_-" + AmaltheaPackage.eINSTANCE.INamed_Name.name + "=" + named.name);
	}
	
	private def void assertTuid(EObject object, String expectedNamespaceUri, String expectedIdentifier) {
		val tuidFragments = asemDomain.calculateTuid(object).toString.split("#");
		assertEquals(3, tuidFragments.length);
		assertEquals(expectedNamespaceUri, tuidFragments.get(0));
		assertNotNull(tuidFragments.get(1));
		assertEquals(expectedIdentifier, tuidFragments.get(2));
	}
	
}