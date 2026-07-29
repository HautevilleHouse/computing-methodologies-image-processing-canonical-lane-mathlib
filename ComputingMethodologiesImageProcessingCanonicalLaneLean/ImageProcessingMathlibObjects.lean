import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace ComputingMethodologiesImageProcessingCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure ImagePixel where
  x : ℕ
  y : ℕ
  intensity : ℝ

structure ImageSpace where
  carrier : Type
  topology : TopologicalSpace carrier
  pixels : carrier → List ImagePixel

structure ImageProcessingAdmittedObject where
  space : ImageSpace
  sampleSize : ℕ
  resolution : ℕ
  digitalObject : Prop
  convolutionModel : Type
  convolutionTopology : TopologicalSpace convolutionModel
  linearFilterClosed : Prop
  conclusion : linearFilterClosed

structure ImageProcessingEndgameState where
  object : ImageProcessingAdmittedObject

def ImageProcessingWitnessClosed (O : ImageProcessingAdmittedObject) : Prop :=
  O.linearFilterClosed

end ComputingMethodologiesImageProcessingCanonicalLaneLean
end HautevilleHouse