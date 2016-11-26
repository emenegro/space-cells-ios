
import Foundation

protocol GetSpacePosters {
    func getPosters()
}

protocol GetSpacePostersOutput: class {
    func onPosters(posters: [Poster])
}

class GetSpacePostersImpl {
    
    let repository: PostersRepository
    weak var output: GetSpacePostersOutput?
    
    init(repository: PostersRepository) {
        self.repository = repository
    }
}

extension GetSpacePostersImpl: GetSpacePosters {
    
    func getPosters() {
        repository.getPosters()
    }
}

extension GetSpacePostersImpl: PostersRepositoryOutput {
    
    func onPosters(posters: [Poster]) {
        output?.onPosters(posters: posters)
    }
}
