Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DB76CA9E
	for <lists+nouveau@lfdr.de>; Thu, 18 Jul 2019 10:07:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F426E33A;
	Thu, 18 Jul 2019 08:07:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C1A46E33A
 for <nouveau@lists.freedesktop.org>; Thu, 18 Jul 2019 08:07:47 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id f17so24612109wme.2
 for <nouveau@lists.freedesktop.org>; Thu, 18 Jul 2019 01:07:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GywUVIvxwTPFuct0ezFZMuXgvE7lpSwPSm5HLGWFtdY=;
 b=EO+m0TSlis+umCtuS3n8laOkYSmxVZ2IjgXhA9cRHFAlCVnQR+je2bBFdmomiAugJE
 8ZvPrhPtHu4yhBhr5M1nfVG34hC7Tl5lOucdApniZU56sSNBqQBGy+rVERze5fk/BmbK
 aNJmWdefFC/CS2IrYXdIlKmof5H1IqcbbqcFOt6WZoAgohTp088n09LP8CSGjXQQLuUm
 aQA9m4BW75iPjcH8juvmNinR+PfJlobfAHa14V/UFUGjeJCLW6zkHGn7DboKmz5/NWZB
 zFlBJcYoyqSGAsorDgDdqzvu2HfvqQAe5+x/wHaruBfCWnnM4W4SsKo+Z4u/3inaRbSd
 6iaw==
X-Gm-Message-State: APjAAAUU3vZ19MxL679pihcPyDNbIP8Vch2itsMaiLH2Qs86rq1JqfRb
 fEYJst1HlTKoFIvE8LfPY3v05QXz1ro=
X-Google-Smtp-Source: APXvYqwcDNDTtOwqM9YUxG6k0mTpzy1sE9MYyoV1hxGKIQK7ygCknHGWs0zxEUftFRJh6W4MvbUXlg==
X-Received: by 2002:a7b:c5d6:: with SMTP id n22mr41354576wmk.170.1563437265484; 
 Thu, 18 Jul 2019 01:07:45 -0700 (PDT)
Received: from localhost.localdomain.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id z1sm28354532wrv.90.2019.07.18.01.07.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 18 Jul 2019 01:07:45 -0700 (PDT)
From: Mark Menzynski <mmenzyns@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 18 Jul 2019 10:07:37 +0200
Message-Id: <20190718080741.3147-1-mmenzyns@redhat.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [Nouveau] [PATCH v3 0/4] Refuse to load if power cable are not
 connected
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

QWRkZWQgY29uZmlnIG92ZXJyaWRlIGZvciBwb3dlciBjaGVja3MuCgpNYXJrIE1lbnp5bnNraSAo
NCk6CiAgYmlvcy9ncGlvOiBzb3J0IGdwaW9zIGJ5IHZhbHVlcwogIGdwaW86IGZhaWwgaWYgZ3B1
IGV4dGVybmFsIHBvd2VyIGlzIG1pc3NpbmcKICBncGlvOiBjaGVjayB0aGUgZ3BpbyBmdW5jdGlv
biAxNiBpbiB0aGUgcG93ZXIgY2hlY2sgYXMgd2VsbAogIGdwaW86IGNoZWNrIGZ1bmN0aW9uIDc2
IGluIHRoZSBwb3dlciBjaGVjayBhcyB3ZWxsCgogZHJtL25vdXZlYXUvaW5jbHVkZS9udmttL3N1
YmRldi9iaW9zL2dwaW8uaCB8ICA1ICsrKy0KIGRybS9ub3V2ZWF1L252a20vc3ViZGV2L2dwaW8v
YmFzZS5jICAgICAgICAgfCAzMiArKysrKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdl
ZCwgMzYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKLS0gCjIuMjEuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxp
c3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
