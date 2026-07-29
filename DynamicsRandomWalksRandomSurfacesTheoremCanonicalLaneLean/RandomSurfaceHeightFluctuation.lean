import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean

structure RandomSurfaceHeightFluctuationPackage where
  heightFunction : Type u → Type v
  fluctuationMeasure : Type w
  gaussianFreeFieldLimit : Prop
  scaleInvariance : Prop
  logCorrelated : Prop

structure RandomSurfaceHeightFluctuationEvidence (H : RandomSurfaceHeightFluctuationPackage) where
  gaussianFreeFieldLimitClosed : H.gaussianFreeFieldLimit
  scaleInvarianceClosed : H.scaleInvariance
  logCorrelatedClosed : H.logCorrelated

def RandomSurfaceHeightFluctuationClosed (H : RandomSurfaceHeightFluctuationPackage) : Prop :=
  H.gaussianFreeFieldLimit ∧ H.scaleInvariance ∧ H.logCorrelated

theorem random_surface_height_fluctuation_closed_from_evidence
    (H : RandomSurfaceHeightFluctuationPackage)
    (E : RandomSurfaceHeightFluctuationEvidence H) : RandomSurfaceHeightFluctuationClosed H := by
  exact And.intro E.gaussianFreeFieldLimitClosed
    (And.intro E.scaleInvarianceClosed E.logCorrelatedClosed)

end DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean
end HautevilleHouse
