import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean

structure HeightFluctuation (S : RandomSurfaceModel) where
  fluctuationField : S.surfaceType → ℝ
  gaussianFreeField : Prop
  covarianceStructure : S.surfaceType → S.surfaceType → ℝ
  scaleInvariance : Prop

structure HeightFluctuationEvidence (S : RandomSurfaceModel) (H : HeightFluctuation S) where
  gaussianFreeFieldClosed : H.gaussianFreeField
  covarianceStructureClosed : ∀ x y : S.surfaceType, H.covarianceStructure x y ≥ 0
  scaleInvarianceClosed : H.scaleInvariance

def HeightFluctuationClosed (S : RandomSurfaceModel) (H : HeightFluctuation S) : Prop :=
  H.gaussianFreeField ∧ (∀ x y : S.surfaceType, H.covarianceStructure x y ≥ 0) ∧ H.scaleInvariance

theorem height_fluctuation_closed_from_evidence (S : RandomSurfaceModel) (H : HeightFluctuation S) (E : HeightFluctuationEvidence S H) : HeightFluctuationClosed S H := by
  exact And.intro E.gaussianFreeFieldClosed (And.intro E.covarianceStructureClosed E.scaleInvarianceClosed)

end DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean
end HautevilleHouse