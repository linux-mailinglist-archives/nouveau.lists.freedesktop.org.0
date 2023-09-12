Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC2C7B2E1F
	for <lists+nouveau@lfdr.de>; Fri, 29 Sep 2023 10:42:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2FB010E6EC;
	Fri, 29 Sep 2023 08:42:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 574 seconds by postgrey-1.36 at gabe;
 Tue, 12 Sep 2023 16:40:39 UTC
Received: from w1.tutanota.de (w1.tutanota.de [81.3.6.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49F8A10E43B
 for <nouveau@lists.freedesktop.org>; Tue, 12 Sep 2023 16:40:39 +0000 (UTC)
Received: from tutadb.w10.tutanota.de (unknown [192.168.1.10])
 by w1.tutanota.de (Postfix) with ESMTP id 43D8BFBFBB4
 for <nouveau@lists.freedesktop.org>; Tue, 12 Sep 2023 16:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1694536263; 
 s=s1; d=tuta.io;
 h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Date:Date:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:Sender;
 bh=Puh9NOWNjsc5lU/aMVa/EJEHx9cEfQEx1pxPoyK0dkU=;
 b=xLl4h5VX0ekQ2l+kWPf9Yi6rqt+PAcTJlJudFlWbHrP+kSvMAuS0lvq4OhPmpZ+g
 IndV/8yH4GQ4tKYSwBOP63LTuKOjNqLvQ/7prWMuE2OciPCv3ERZjh2qT32n8FLUKYF
 vyZw6oSPCD07r3JjP7L928k0BfETLCJiWHO0Z7+QIAD58uWdSIBh1fIarOqcHs5kn+c
 rPVbJebRNWMoUs2OK+xppHKq6V85NF+0sHZhXtEi7/0/IOGQW/Vs2Z6NrZZTKGU3Kf7
 yE/u5cgUKGh1M+JcuaEuKMCTMUdYwbe7dRwhB31jXDSxQSz75c2gOquNHUA/vwmP/Ji
 baCQ2cyixQ==
Date: Tue, 12 Sep 2023 18:31:03 +0200 (CEST)
From: stratus@tuta.io
To: Nouveau <nouveau@lists.freedesktop.org>
Message-ID: <Ne9DqFj--3-9@tuta.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 29 Sep 2023 08:42:15 +0000
Subject: [Nouveau] Some monitors not working after 6.2 kernel due to Nouveau
 commit
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Dear Nouveau developers,
I encountered this problem using Artix Linux:
https://forum.artixlinux.org/index.php/topic,5859

On 2 laptops (Dell M4400 and M4500, Nvidia graphics using Nouveau) which ha=
ve a VGA port, a Maxim MX11-LCD15 TV with a VGA port stopped working, also =
another Panasonic TX-26LXD500 TV using VGA. These are older TV's, from the =
2000's, I guess the EDID might not be entirely compliant with modern standa=
rds. A newish AEC monitor (not TV) did work with the latest kernels so not =
all VGA connected monitors are affected.

From searching online it seems that there are numerous reports of monitors =
stopping working with the 6.2 kernel in various distros.

This is the commit where the problem apparently first appears:
https://cgit.freedesktop.org/drm-intel/commit/?h=3Ddrm-intel-fixes&id=3Df53=
0bc60a30bee47ff51b7fb71511fdd058b774a

commit f530bc60a30bee47ff51b7fb71511fdd058b774a (HEAD)
Author: Ben Skeggs <bskeggs@redhat.com>
Date:=C2=A0=C2=A0 Wed Jun 1 20:46:33 2022 +1000

=C2=A0 =C2=A0 drm/nouveau/disp: move HDMI config into acquire + infoframe m=
ethods
=C2=A0 =C2=A0=20
=C2=A0 =C2=A0 v2:
=C2=A0 =C2=A0 - fix typo in sorhdmi/g84 struct initialiser (kbuild test rob=
ot)
=C2=A0 =C2=A0 v3:
=C2=A0 =C2=A0 - less convoluted flow control in nvkm_uoutp_mthd_acquire_tmd=
s() (lyude)
=C2=A0 =C2=A0 v4:
=C2=A0 =C2=A0 - we don't support hdmi on original nv50, don't try
=C2=A0 =C2=A0=20
=C2=A0 =C2=A0 Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
=C2=A0 =C2=A0 Reviewed-by: Lyude Paul <lyude@redhat.com>

