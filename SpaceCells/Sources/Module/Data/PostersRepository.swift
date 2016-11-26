
import Foundation

protocol PostersRepository {
    func getPosters()
}

protocol PostersRepositoryOutput: class {
    func onPosters(posters: [Poster])
}

class PostersRepositoryImpl {

    let localDataSource: PostersLocalDataSource
    weak var output: PostersRepositoryOutput?
    
    init(localDataSource: PostersLocalDataSource) {
        self.localDataSource = localDataSource
    }
}

extension PostersRepositoryImpl: PostersRepository {
    
    func getPosters() {
        localDataSource.getPosters { [weak self] posters in
            self?.output?.onPosters(posters: posters)
        }
    }
}
