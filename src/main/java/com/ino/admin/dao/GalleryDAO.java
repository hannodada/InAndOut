package com.ino.admin.dao;

import java.util.ArrayList;

import com.ino.admin.dto.GalleryDTO;

public interface GalleryDAO {


	int totalCount();

	ArrayList<GalleryDTO> list(int offset);

}
