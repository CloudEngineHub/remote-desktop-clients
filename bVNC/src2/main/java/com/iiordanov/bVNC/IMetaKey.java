/**
 * Copyright (C) 2012 Iordan Iordanov
 * Copyright (C) 2009 Michael A. MacDonald
 *
 * This is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 * 
 * This software is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this software; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307,
 * USA.
 */

package com.iiordanov.bVNC;

import com.antlersoft.android.db.FieldAccessor;
import com.antlersoft.android.db.TableInterface;

/**
 * @author Michael A. MacDonald
 *
 */
@TableInterface(TableName="META_KEY",ImplementingClassName="AbstractMetaKeyBean")
public interface IMetaKey {
    @FieldAccessor
    long get_Id();
    @FieldAccessor
    long getMetaListId();
    @FieldAccessor
    String getKeyDesc();
    @FieldAccessor
    int getMetaFlags();
    @FieldAccessor
    boolean isMouseClick();
    @FieldAccessor
    int getMouseButtons();
    @FieldAccessor
    int getKeySym();
    @FieldAccessor
    String getShortcut();
}