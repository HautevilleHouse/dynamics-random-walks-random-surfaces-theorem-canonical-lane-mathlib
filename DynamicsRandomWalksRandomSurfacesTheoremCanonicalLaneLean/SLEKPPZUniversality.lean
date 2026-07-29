import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean.GaussianFreeFieldRoughness

namespace HautevilleHouse
namespace DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean

structure SLEKPZUniversalityPackage {G : GaussianFreeFieldRoughness} where
  schrammLoewnerEvolution : Type u
  drivingFunction : Type v
  localMartingaleProperty : Prop
  scalingLimitConvergence : Prop
  KPZExponent : Prop

structure SLEKPZUniversalityEvidence {G : GaussianFreeFieldRoughness}
    (S : SLEKPZUniversalityPackage G) where
  localMartingalePropertyClosed : S.localMartingaleProperty
  scalingLimitConvergenceClosed : S.scalingLimitConvergence
  KPZExponentClosed : S.KPZExponent

def SLEKPZUniversalityClosed {G : GaussianFreeFieldRoughness}
    (S : SLEKPZUniversalityPackage G) : Prop :=
  S.localMartingaleProperty ∧ S.scalingLimitConvergence ∧ S.KPZExponent

theorem sle_kpz_universality_closed_from_evidence {G : GaussianFreeFieldRoughness}
    (S : SLEKPZUniversalityPackage G) (E : SLEKPZUniversalityEvidence S) :
    SLEKPZUniversalityClosed S := by
  exact And.intro E.localMartingalePropertyClosed
    (And.intro E.scalingLimitConvergenceClosed E.KPZExponentClosed)

end DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean
end HautevilleHouse