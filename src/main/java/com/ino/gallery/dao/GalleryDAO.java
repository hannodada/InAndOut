package com.ino.gallery.dao;

import com.ino.gallery.dto.GalleryDTO;

public interface GalleryDAO {

	int galleryWrite(GalleryDTO dto);

	void fileWrite(String ori_photo_name, String new_photo_name, int idx, String cate_no);

}
