Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E849B87E
	for <lists+nouveau@lfdr.de>; Sat, 24 Aug 2019 00:18:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A3D26ED67;
	Fri, 23 Aug 2019 22:18:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D45FF6ED5D;
 Fri, 23 Aug 2019 22:18:12 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d6066240001>; Fri, 23 Aug 2019 15:18:12 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 23 Aug 2019 15:18:12 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 23 Aug 2019 15:18:12 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 23 Aug
 2019 22:18:07 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 23 Aug 2019 22:18:07 +0000
Received: from rcampbell-dev.nvidia.com (Not Verified[10.110.48.66]) by
 hqnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5d60661e0003>; Fri, 23 Aug 2019 15:18:06 -0700
From: Ralph Campbell <rcampbell@nvidia.com>
To: <linux-mm@kvack.org>
Date: Fri, 23 Aug 2019 15:17:51 -0700
Message-ID: <20190823221753.2514-1-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1566598693; bh=Z6axOFKbUvqsjcFqMxwwOrZTql7QqKTfP0heWnYU1Z8=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 MIME-Version:X-NVConfidentiality:Content-Transfer-Encoding:
 Content-Type;
 b=ctpsqG1kNxP+YzsOTUXs7AwK5TY2o4ZmwFLtokaKLQ4zXNU31nsT4X7JyHtFGc5fe
 O8xIorB0RJZR6/3g7TN0cjxJ0/JlP3grcpjxY6NHweE6/eyjaFRSeeYH/peSmE7G5E
 6FiA1tTrxCHIAWyCwjMVD8eWRBvO37Z3HtCxaHyPi8tCz1GQZvv+j03ery4xJu2Nvb
 rik3UshHudfzSfYw2qCWIlQKCR9d0zLt50+Q354r5dPupAuz4gjV8IJsaeiLwrVPAQ
 M/0ar3v6Up8fbsIC/Ld11+CbgBG306Z+AOrZZelEg4l+GgDLY6zz0F1xBu2md0eZ1G
 mlS04Yqu1Mb/w==
Subject: [Nouveau] [PATCH 0/2] mm/hmm: two bug fixes for hmm_range_fault()
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: Ralph Campbell <rcampbell@nvidia.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jason Gunthorpe <jgg@mellanox.com>, amd-gfx@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

SSBoYXZlIGJlZW4gd29ya2luZyBvbiBjb252ZXJ0aW5nIEplcm9tZSdzIGhtbV9kdW1teSBkcml2
ZXIgYW5kIHNlbGYKdGVzdHMgaW50byBhIHN0YW5kLWFsb25lIHNldCBvZiB0ZXN0cyB0byBiZSBp
bmNsdWRlZCBpbgp0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy92bSBhbmQgY2FtZSBhY3Jvc3MgdGhl
c2UgdHdvIGJ1ZyBmaXhlcyBpbiB0aGUKcHJvY2Vzcy4gVGhlIHRlc3RzIGFyZW4ndCBxdWl0ZSBy
ZWFkeSB0byBiZSBwb3N0ZWQgYXMgYSBwYXRjaC4KSSdtIHBvc3RpbmcgdGhlIGZpeGVzIG5vdyBz
aW5jZSBJIHRob3VnaHQgdGhleSBzaG91bGRuJ3Qgd2FpdC4KVGhleSBzaG91bGQgcHJvYmFibHkg
aGF2ZSBhIGZpeGVzIGxpbmUgYnV0IHdpdGggYWxsIHRoZSBITU0gY2hhbmdlcywKSSB3YXNuJ3Qg
c3VyZSBleGFjdGx5IHdoaWNoIGNvbW1pdCB0byB1c2UuCgpUaGVzZSBhcmUgYmFzZWQgb24gdG9w
IG9mIEphc29uJ3MgbGF0ZXN0IGhtbSBicmFuY2guCgpSYWxwaCBDYW1wYmVsbCAoMik6CiAgbW0v
aG1tOiBobW1fcmFuZ2VfZmF1bHQoKSBOVUxMIHBvaW50ZXIgYnVnCiAgbW0vaG1tOiBobW1fcmFu
Z2VfZmF1bHQoKSBpbmZpbml0ZSBsb29wCgogbW0vaG1tLmMgfCAxNiArKysrKysrKysrKystLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCi0tIAoy
LjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5v
dXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
