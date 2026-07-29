import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean

structure DelaunayTriangulationRandomSurfacePackage where
  pointProcess : Type u → Type v
  delaunayTriangulation : Type w
  discreteGaussianCurvature : Type x
  discreteBiotSavartLaw : Prop
  scalingLimitConvergence : Prop

structure DelaunayTriangulationRandomSurfaceEvidence (D : DelaunayTriangulationRandomSurfacePackage) where
  discreteBiotSavartLawClosed : D.discreteBiotSavartLaw
  scalingLimitConvergenceClosed : D.scalingLimitConvergence

def DelaunayTriangulationRandomSurfaceClosed (D : DelaunayTriangulationRandomSurfacePackage) : Prop :=
  D.discreteBiotSavartLaw ∧ D.scalingLimitConvergence

theorem delaunay_triangulation_random_surface_closed_from_evidence
    (D : DelaunayTriangulationRandomSurfacePackage)
    (E : DelaunayTriangulationRandomSurfaceEvidence D) : DelaunayTriangulationRandomSurfaceClosed D := by
  exact And.intro E.discreteBiotSavartLawClosed E.scalingLimitConvergenceClosed

end DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean
end HautevilleHouse
