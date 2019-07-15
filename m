Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4384F68682
	for <lists+nouveau@lfdr.de>; Mon, 15 Jul 2019 11:43:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D85589904;
	Mon, 15 Jul 2019 09:43:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 143E589904
 for <nouveau@lists.freedesktop.org>; Mon, 15 Jul 2019 09:43:06 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id z1so16287149wru.13
 for <nouveau@lists.freedesktop.org>; Mon, 15 Jul 2019 02:43:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZouXRxeYz5RItgb6WYUSQHKONSVg5uwDIFKhjkglniQ=;
 b=imS3wp7DnsGv4quNOwKhkbpuAZufusg6gykWiqpTLtKVGVwzCTmKoptaqI9TmegGui
 2mv7iIzjfoQUqjhuQmoe6bB8dJrybuW69rm27/ubJQ0H72WIV7Y4kQgQMf3mRY2vlUQd
 1czH4Imam8c0faxbtJnYDCLXu9shwLW9Be+u4kIpByzSvMyxcZC0EuApEN4ArXXXTcU0
 CQju7W05hkiKusD7medUj8zE/Vy9DCHO4anCN2LvPApQxsSzNmVzbHRPGpoT+sJLn6Ni
 u9SJ8+p0IBM1ZnUneXD9Hre47dLcDL0ZJt4PFWBpNkQQ2eO7IkeY0SLtU3jXyHghfbAs
 Eo9Q==
X-Gm-Message-State: APjAAAUhSMmhCJ5EsV9l81pbp/2LmlvRc0PH5cL/T+nRmjvXque+YL/B
 i4A8+RudnJ9NyJWEIeOWpIDfleZEIu0=
X-Google-Smtp-Source: APXvYqzDDIGW0jdR+kSDPAaOf6ASkuUQGyKDunjPzArIPhqicVun1P6pIUWIpXNQ/wylpx7kj276mw==
X-Received: by 2002:adf:da4d:: with SMTP id r13mr22054161wrl.281.1563183784543; 
 Mon, 15 Jul 2019 02:43:04 -0700 (PDT)
Received: from localhost.localdomain.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id o126sm14383044wmo.1.2019.07.15.02.43.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 02:43:03 -0700 (PDT)
From: Mark Menzynski <mmenzyns@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Mon, 15 Jul 2019 11:42:43 +0200
Message-Id: <20190715094247.8331-1-mmenzyns@redhat.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [Nouveau] [PATCH v2 0/4] Refuse to load if power cables are not
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

VHJlbGxvOiAKaHR0cHM6Ly90cmVsbG8uY29tL2MvYWRtekRSdmQvNTAtcmVkdWNlLXBlcmZvcm1h
bmNlLXJlZnVzZS10by1ib290LWlmLW5vdC1hbGwtdGhlLXBvd2VyLWNvbm5lY3RvcnMtYXJlLXBs
dWdnZWQKCkZpeGVkIGNvbW1pdCBtZXNzYWdlcy4KCk1hcmsgTWVuenluc2tpICg0KToKICBiaW9z
L2dwaW86IHNvcnQgZ3Bpb3MgYnkgdmFsdWVzCiAgZ3BpbzogZmFpbCBpZiBncHUgZXh0ZXJuYWwg
cG93ZXIgaXMgbWlzc2luZwogIGdwaW86IGNoZWNrIHRoZSBncGlvIGZ1bmN0aW9uIDE2IGluIHRo
ZSBwb3dlciBjaGVjayBhcyB3ZWxsCiAgZ3BpbzogY2hlY2sgZnVuY3Rpb24gNzYgaW4gdGhlIHBv
d2VyIGNoZWNrIGFzIHdlbGwKCiBkcm0vbm91dmVhdS9pbmNsdWRlL252a20vc3ViZGV2L2Jpb3Mv
Z3Bpby5oIHwgIDUgKysrKy0KIGRybS9ub3V2ZWF1L252a20vc3ViZGV2L2dwaW8vYmFzZS5jICAg
ICAgICAgfCAyNSArKysrKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMjkgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVh
dUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9ub3V2ZWF1
