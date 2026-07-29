import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean

structure RandomSurfaceModel where
  surfaceType : Type u
  areaMeasure : surfaceType → Prop
  curvatureDistribution : surfaceType → ℝ
  heightField : surfaceType → ℝ
  randomWalkCoupling : surfaceType → surfaceType → Prop

structure RandomSurfaceEvidence (S : RandomSurfaceModel) where
  areaMeasureClosed : ∃ A : S.surfaceType, S.areaMeasure A
  curvatureDistributionClosed : ∀ x : S.surfaceType, S.curvatureDistribution x ∈ Set.Ioo (-∞) (∞)
  heightFieldClosed : ∀ x : S.surfaceType, S.heightField x = 0 ∨ S.heightField x ≠ 0
  randomWalkCouplingClosed : ∀ x y : S.surfaceType, S.randomWalkCoupling x y → S.areaMeasure x ∧ S.areaMeasure y

def RandomSurfaceModelClosed (S : RandomSurfaceModel) : Prop :=
  (∃ A : S.surfaceType, S.areaMeasure A) ∧
  (∀ x : S.surfaceType, S.curvatureDistribution x ∈ Set.Ioo (-∞) (∞)) ∧
  (∀ x : S.surfaceType, S.heightField x = 0 ∨ S.heightField x ≠ 0) ∧
  (∀ x y : S.surfaceType, S.randomWalkCoupling x y → S.areaMeasure x ∧ S.areaMeasure y)

theorem random_surface_model_closed_from_evidence (S : RandomSurfaceModel) (E : RandomSurfaceEvidence S) : RandomSurfaceModelClosed S := by
  exact And.intro E.areaMeasureClosed (And.intro E.curvatureDistributionClosed (And.intro E.heightFieldClosed E.randomWalkCouplingClosed))

end DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean
end HautevilleHouse