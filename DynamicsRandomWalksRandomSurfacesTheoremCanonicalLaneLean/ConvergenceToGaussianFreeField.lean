import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean

structure ConvergenceToGaussianFreeField (R : RandomWalkModel) (S : RandomSurfaceModel) (K : CouplingKernel R S) (H : HeightFluctuation S) where
  scalingLimit : Prop
  weakConvergence : Prop
  limitField : S.surfaceType → ℝ
  limitCovariance : S.surfaceType → S.surfaceType → ℝ

structure ConvergenceToGaussianFreeFieldEvidence (R : RandomWalkModel) (S : RandomSurfaceModel) (K : CouplingKernel R S) (H : HeightFluctuation S) (C : ConvergenceToGaussianFreeField R S K H) where
  scalingLimitClosed : C.scalingLimit
  weakConvergenceClosed : C.weakConvergence
  limitFieldClosed : ∀ x : S.surfaceType, C.limitField x ∈ Set.Ioo (-∞) (∞)
  limitCovarianceClosed : ∀ x y : S.surfaceType, C.limitCovariance x y = H.covarianceStructure x y

def ConvergenceToGaussianFreeFieldClosed (R : RandomWalkModel) (S : RandomSurfaceModel) (K : CouplingKernel R S) (H : HeightFluctuation S) (C : ConvergenceToGaussianFreeField R S K H) : Prop :=
  C.scalingLimit ∧ C.weakConvergence ∧ (∀ x : S.surfaceType, C.limitField x ∈ Set.Ioo (-∞) (∞)) ∧ (∀ x y : S.surfaceType, C.limitCovariance x y = H.covarianceStructure x y)

theorem convergence_to_gaussian_free_field_closed_from_evidence (R : RandomWalkModel) (S : RandomSurfaceModel) (K : CouplingKernel R S) (H : HeightFluctuation S) (C : ConvergenceToGaussianFreeField R S K H) (E : ConvergenceToGaussianFreeFieldEvidence R S K H C) : ConvergenceToGaussianFreeFieldClosed R S K H C := by
  exact And.intro E.scalingLimitClosed (And.intro E.weakConvergenceClosed (And.intro E.limitFieldClosed E.limitCovarianceClosed))

end DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean
end HautevilleHouse