package com.nilesh.springCRUD.services;

import com.nilesh.springCRUD.model.RatingEntity;
import com.nilesh.springCRUD.repository.RatingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RatingService {
    @Autowired
    RatingRepository ratingRepository;

    public List<RatingEntity> findByProductId(int product_id) { return ratingRepository.findByProductId(product_id);
    }

    public void save(RatingEntity ratingEntity) { ratingRepository.save(ratingEntity);
    }

    public RatingEntity findById(int ratingId) { return ratingRepository.findById(ratingId);
    }
}
