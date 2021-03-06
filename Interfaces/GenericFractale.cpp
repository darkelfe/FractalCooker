/*
 * Auteur					:	Rosset Julien
 *
 * Projet					:	FractalCooker/Interfaces
 * Fichier					:	GenericFractale.cpp
 *
 * Date de création			:	samedi 17 décembre 2011
 */

/* Copyright (C) 2010-2011 LEVIGNE Florent, GROCCIA Patricia, RICHARD Thomas, ROSSET Julien
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 */

#include "GenericFractale.h"
using namespace Interfaces;

GenericFractale::GenericFractale () :
	m_cancel(false),
	m_cancel_mutex(),
	m_nbIterations(0)
{}
GenericFractale::~GenericFractale () {}

quint32 GenericFractale::nbIterations () const {
	return m_nbIterations;
}
void GenericFractale::setNbIterations (quint32 nbIte) {
	m_nbIterations = nbIte;
}


void GenericFractale::cancel () {
	QMutexLocker lock(&m_cancel_mutex);
	m_cancel = true;
}
bool GenericFractale::isCancel () {
	QMutexLocker lock(&m_cancel_mutex);
	return m_cancel;
}
void GenericFractale::resetCancel () {
	QMutexLocker lock(&m_cancel_mutex);
	m_cancel = false;
}
