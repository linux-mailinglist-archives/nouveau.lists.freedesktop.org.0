Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 085A9262E33
	for <lists+nouveau@lfdr.de>; Wed,  9 Sep 2020 13:51:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46E9A6EE5E;
	Wed,  9 Sep 2020 11:51:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9437F6EE5E
 for <nouveau@lists.freedesktop.org>; Wed,  9 Sep 2020 11:51:38 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 089BnHEs135300;
 Wed, 9 Sep 2020 11:51:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=CM0tM/VEh+FrkcXSDU38LVNhV3hFweIx9cXZ6/JAFwQ=;
 b=t7ij6Pkk1JueI8HDkWWWR84r9uDsPf5GQbh5ayjYpJfxKt8oYXttAXl69RJyQbWdgmNZ
 /Vyr9l4E+vfCkGwhDk0OErqasOL8F4ZGaV+kYyEjtTpq163VUnZLLm6Ts1Ca4A7yaVNw
 +pDwYB+mVEPX9aKW0VeOjNIAqehfzA3mqXo1x3cVaExufvBcocRppQtgEtaO1xDuAAE2
 9V+YcAXsstJ4z7qjaeoP2H50lW14IABwnFP7XS5UeMm/Wo0ecbQ/ARSCHGa7JAHV72X8
 GUYIGwI7N4YH7cLLn+oPohGxuptmVoiHvmyGOGLkBjN4JP2Ws+HOFXKxaKxyAXU3YSIb bQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 33c23r18sv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 09 Sep 2020 11:51:36 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 089BjTJP166906;
 Wed, 9 Sep 2020 11:49:35 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 33cmesqm7h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 09 Sep 2020 11:49:35 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 089BnZ0a003863;
 Wed, 9 Sep 2020 11:49:35 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 09 Sep 2020 04:49:34 -0700
Date: Wed, 9 Sep 2020 14:49:24 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: christian.koenig@amd.com
Message-ID: <20200909114924.GA17899@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9738
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=3 adultscore=0
 bulkscore=0 phishscore=0 malwarescore=0 mlxlogscore=873 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009090105
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9738
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 priorityscore=1501
 mlxlogscore=883 mlxscore=0 bulkscore=0 suspectscore=3 spamscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1011
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009090106
Subject: [Nouveau] [bug report] drm/nouveau: move io_reserve_lru handling
 into the driver v5
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hello Christian K=F6nig,

The patch 141b15e59175: "drm/nouveau: move io_reserve_lru handling
into the driver v5" from Aug 21, 2020, leads to the following static
checker warning:

	drivers/gpu/drm/nouveau/nouveau_ttm.c:148 nouveau_ttm_fault()
	warn: inconsistent returns '*bo->base.resv'.

drivers/gpu/drm/nouveau/nouveau_ttm.c
   126  static vm_fault_t nouveau_ttm_fault(struct vm_fault *vmf)
   127  {
   128          struct vm_area_struct *vma =3D vmf->vma;
   129          struct ttm_buffer_object *bo =3D vma->vm_private_data;
   130          pgprot_t prot;
   131          vm_fault_t ret;
   132  =

   133          ret =3D ttm_bo_vm_reserve(bo, vmf);
   134          if (ret)
   135                  return ret;
   136  =

   137          nouveau_bo_del_io_reserve_lru(bo);
   138  =

   139          prot =3D vm_get_page_prot(vma->vm_flags);
   140          ret =3D ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_P=
REFAULT, 1);
   141          if (ret =3D=3D VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_=
RETRY_NOWAIT))
   142                  return ret;
                        ^^^^^^^^^^
Call dma_resv_unlock() before returning?

   143  =

   144          nouveau_bo_add_io_reserve_lru(bo);
   145  =

   146          dma_resv_unlock(bo->base.resv);
   147  =

   148          return ret;
   149  }

regards,
dan carpenter
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
