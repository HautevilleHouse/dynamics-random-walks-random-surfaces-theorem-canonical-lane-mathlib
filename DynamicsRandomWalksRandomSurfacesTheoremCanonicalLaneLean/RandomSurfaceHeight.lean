import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean

structure RandomSurfaceHeightPackage where
  surfaceGraph : Type u
  vertices : surfaceGraph → Type v
  heightFunction : (s : surfaceGraph) → vertices s → ℝ
  gaussianFreeFieldLike : Prop
  heightDifferenceDistribution : (s : surfaceGraph) → vertices s → vertices s → ℝ → Prop
  sosModel : Prop

def RandomSurfaceHeightClosed {s : surfaceGraph} (H : RandomSurfaceHeightPackage) : Prop :=
  H.gaussianFreeFieldLike ∧ H.sosModel

structure RandomSurfaceHeightEvidence {s : surfaceGraph} (H : RandomSurfaceHeightPackage s) where
  gaussianFreeFieldLikeClosed : H.gaussianFreeFieldLike
  sosModelClosed : H.sosModel

theorem random_surface_height_closed_from_evidence {s : surfaceGraph} (H : RandomSurfaceHeightPackage s) (E : RandomSurfaceHeightEvidence H) : RandomSurfaceHeightClosed H := by
  exact And.intro E.gaussianFreeFieldLikeClosed E.sosModelClosed

end DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean
end HautevilleHouse