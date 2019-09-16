Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B33E5B3C6C
	for <lists+nouveau@lfdr.de>; Mon, 16 Sep 2019 16:19:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8DDE891BE;
	Mon, 16 Sep 2019 14:19:41 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC8A6E995;
 Mon, 16 Sep 2019 14:19:39 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id i1so38513851wro.4;
 Mon, 16 Sep 2019 07:19:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K/aqa8wyEzI7hKnOstgjQTU9TQtcMPq+3QSEdDeISWk=;
 b=Y5aa0hwFK8sGkjrfwelg5rvp0bqx+4PPn0H/W+oWFWstDv1X6W1w+4GygUFfqIIBvp
 O2Q0sfOwK0fnaByBntXnpUZMs2Akp3DI8FFohRGjocrADVVUpygLT4XMT7fskr2UkhbQ
 2l2RqEnrDmuVRfKMitDqgBaoXosMd9PBVl4eogM1FILdLVMNEtqcZQV5iNrtCDMebkVT
 KbJFGgW/IJgSWqYUYZiU4wxcOLB4lKUT9ZkHAePLrHqxYZS3MLDA8VAHBoGHLdypYBFx
 GuO1zwtLBKzbemjC/h95AG1DslVJ56plCU2vn1tEZBi2NMw20ajmzZewL4o7h1+aR1ZC
 L4jg==
X-Gm-Message-State: APjAAAWZWRcK0WrFdWG66oRA11iG3GpTquG/c9A3VqSK2YPrAQOFqiEu
 b4H058nMsa1c63NWpC4LX3I=
X-Google-Smtp-Source: APXvYqyLRKCJvKGiHtAK6p0xPtb5g3mQCUuwYktAFvlduaRrG9gNMMZbt31EI9JuwUwobVOKNs9xaA==
X-Received: by 2002:a5d:6647:: with SMTP id f7mr41961wrw.170.1568643577599;
 Mon, 16 Sep 2019 07:19:37 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id f3sm4234489wrq.53.2019.09.16.07.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2019 07:19:36 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>
Date: Mon, 16 Sep 2019 16:19:26 +0200
Message-Id: <20190916141926.8594-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190916141926.8594-1-thierry.reding@gmail.com>
References: <20190916141926.8594-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K/aqa8wyEzI7hKnOstgjQTU9TQtcMPq+3QSEdDeISWk=;
 b=sQgDuI/VCwKjhnSuOHydJvpukqlVi43LYislWwvGFeJXatD7ne+0UT+n/P2L5Um55Q
 zi+0kUa3RKo2hJly+SuYmHwfgPW1Yd7mR6EuD/ys6H9Z4/a7QTR/l5rnW3YxxJAAoaid
 upSmWoLufjb0aBLO66uLzZcgkxDiqIvvSNtAsAlbRA4cgvLVVc9Yxu5gfS3AUIsHgfBS
 +Il0MwEL5oLs+zLSf9rUsLPYVT2ibskd01iqp7Ba3QBh0sFc7fTmEVTToRMyDSn1R1ES
 LbL0hhJosgPMnNBoxfOKWej/y+qd4IBlwDmIt87oA9hwZ0QaTrM+zj0MEExywOZalt9F
 eChw==
Subject: [Nouveau] [PATCH 4/4] drm/nouveau: gm20b: Avoid BAR1 teardown
 during init
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCldyaXRpbmcgdGhlIDB4
MTcwNCAoQlVTX0JBUjFfQkxPQ0spIHJlZ2lzdGVyIGNhdXNlcyB0aGUgR1BVIHRvIHByb2JlIHRo
ZQptZW1vcnkgcmVnaW9uIGF0IHRoZSBwcm9ncmFtbWVkIGFkZHJlc3MuIFRoZSByZXN1bHQgaXMg
YW4gYWRkcmVzcyBkZWNvZGUKZXJyb3IgaW4gdGhlIGV4dGVybmFsIG1lbW9yeSBjb250cm9sbGVy
IGJlY2F1c2UgYWRkcmVzcyAwLCB3aGljaCBpcyB3aGF0CmlzIHdyaXR0ZW4gdG8gdGhlIHJlZ2lz
dGVyLCBpcyBub3QgZGVzaWduYXRlZCBhcyBhY2Nlc3NpYmxlIHRvIGRldmljZXMuCgpBdm9pZCB0
cmlnZ2VyaW5nIERNQSBmcm9tIHRoZSBHUFUgYnkgcmVtb3ZpbmcgdGVhcmRvd24gb2YgdGhlIEJB
UjEuCgpTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2Jhci9nbTIwYi5jIHwgMSAt
CiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2Jhci9nbTIwYi5jIGIvZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbnZrbS9zdWJkZXYvYmFyL2dtMjBiLmMKaW5kZXggOTUwYmZmMTk1NWFkLi4xZWQ2MTcw
ODkxYzQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2Jh
ci9nbTIwYi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2Jhci9n
bTIwYi5jCkBAIC0yNiw3ICsyNiw2IEBAIGdtMjBiX2Jhcl9mdW5jID0gewogCS5kdG9yID0gZ2Yx
MDBfYmFyX2R0b3IsCiAJLm9uZWluaXQgPSBnZjEwMF9iYXJfb25laW5pdCwKIAkuYmFyMS5pbml0
ID0gZ2YxMDBfYmFyX2JhcjFfaW5pdCwKLQkuYmFyMS5maW5pID0gZ2YxMDBfYmFyX2JhcjFfZmlu
aSwKIAkuYmFyMS53YWl0ID0gZ20xMDdfYmFyX2JhcjFfd2FpdCwKIAkuYmFyMS52bW0gPSBnZjEw
MF9iYXJfYmFyMV92bW0sCiAJLmZsdXNoID0gZzg0X2Jhcl9mbHVzaCwKLS0gCjIuMjMuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWls
aW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
