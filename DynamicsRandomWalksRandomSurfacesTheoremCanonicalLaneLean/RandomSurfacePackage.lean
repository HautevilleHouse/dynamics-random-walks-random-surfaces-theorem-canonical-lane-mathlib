import DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean.RandomWalkPackage

namespace HautevilleHouse
namespace DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean

structure RandomSurfacePackage {R : RandomWalkPackage} where
  surfaceSpace : Type u
  heightFunction : R.stateSpace → ℝ
  lipschitzConstant : Prop
  gradientGibbsMeasure : Prop
  discreteGaussianFreeFieldLimit : Prop
  lipschitzConstantTerm : lipschitzConstant
  gradientGibbsMeasureTerm : gradientGibbsMeasure
  discreteGaussianFreeFieldLimitTerm : discreteGaussianFreeFieldLimit

def RandomSurfaceClosed {R : RandomWalkPackage} (S : RandomSurfacePackage R) : Prop :=
  S.lipschitzConstant ∧ S.gradientGibbsMeasure ∧ S.discreteGaussianFreeFieldLimit

theorem random_surface_closed_from_evidence {R : RandomWalkPackage}
    (S : RandomSurfacePackage R) : RandomSurfaceClosed S := by
  exact And.intro S.lipschitzConstantTerm
    (And.intro S.gradientGibbsMeasureTerm S.discreteGaussianFreeFieldLimitTerm)

end DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean
end HautevilleHouse
