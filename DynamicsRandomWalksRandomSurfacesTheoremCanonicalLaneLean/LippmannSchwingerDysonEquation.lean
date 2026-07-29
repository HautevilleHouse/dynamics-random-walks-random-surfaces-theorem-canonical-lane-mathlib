import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean

structure LippmannSchwingerDysonEquationPackage where
  randomWalkGreenFunction : Type u → Type v
  selfEnergyKernel : Type w
  dyadicExpansion : Prop
  infraredRenormalization : Prop
  ultravioletFinite : Prop

structure LippmannSchwingerDysonEquationEvidence (L : LippmannSchwingerDysonEquationPackage) where
  dyadicExpansionClosed : L.dyadicExpansion
  infraredRenormalizationClosed : L.infraredRenormalization
  ultravioletFiniteClosed : L.ultravioletFinite

def LippmannSchwingerDysonEquationClosed (L : LippmannSchwingerDysonEquationPackage) : Prop :=
  L.dyadicExpansion ∧ L.infraredRenormalization ∧ L.ultravioletFinite

theorem lippmann_schwinger_dyson_equation_closed_from_evidence
    (L : LippmannSchwingerDysonEquationPackage)
    (E : LippmannSchwingerDysonEquationEvidence L) : LippmannSchwingerDysonEquationClosed L := by
  exact And.intro E.dyadicExpansionClosed
    (And.intro E.infraredRenormalizationClosed E.ultravioletFiniteClosed)

end DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean
end HautevilleHouse
