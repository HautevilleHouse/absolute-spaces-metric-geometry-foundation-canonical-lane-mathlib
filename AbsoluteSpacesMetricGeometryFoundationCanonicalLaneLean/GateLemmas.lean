import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace AbsoluteSpacesMetricGeometryFoundationCanonicalLaneLean

/-- The gate closure condition for an admissible class in absolute spaces metric geometry. -/
def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

/-- From any admissible class, the gate is constructively closed. -/
theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

/-- An absolute space is a metric space with the identity of indiscernibles. -/
structure AbsoluteSpace where
  Carrier : Type
  dist : Carrier → Carrier → ℝ
  dist_self : ∀ x : Carrier, dist x x = 0
  dist_comm : ∀ x y : Carrier, dist x y = dist y x
  dist_triangle : ∀ x y z : Carrier, dist x z ≤ dist x y + dist y z
  dist_nonneg : ∀ x y : Carrier, 0 ≤ dist x y
  dist_eq_zero : ∀ x y : Carrier, dist x y = 0 → x = y

/-- The canonical admissible class attached to an absolute space. -/
def absoluteSpaceAdmissibleClass (X : AbsoluteSpace) : AdmissibleClass where
  endpointSatisfied := X.dist_eq_zero
  remainderRecorded := False
  gateWitness := Or.inl X.dist_eq_zero

/-- The gate closure of the admissible class of an absolute space. -/
theorem absolute_space_gate_closed (X : AbsoluteSpace) :
    gateClosed (absoluteSpaceAdmissibleClass X) := by
  simpa [gateClosed, absoluteSpaceAdmissibleClass] using (Or.inl X.dist_eq_zero)

end AbsoluteSpacesMetricGeometryFoundationCanonicalLaneLean
end HautevilleHouse