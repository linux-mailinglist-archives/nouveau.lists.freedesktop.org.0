Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8DA16B93
	for <lists+nouveau@lfdr.de>; Tue,  7 May 2019 21:42:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 648D989E0C;
	Tue,  7 May 2019 19:42:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6798B89E0C
 for <nouveau@lists.freedesktop.org>; Tue,  7 May 2019 19:42:23 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id d13so3562512qth.5
 for <nouveau@lists.freedesktop.org>; Tue, 07 May 2019 12:42:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=bxSIMmVcuxTsLkgtFcmqzC1m7+HkIq9QWF0K+5MPjng=;
 b=YWW3WN0hKfCMBhjR8mJeRm+XpNfZ9RF2hBoW8dmwLO5M55XlkuDUh0rJX50/cfvNUy
 nrHNU+2oDOdKYeCOGY6Ki5eW/II+EIvPC41IcnyL/5/bhBAtzqhbrXRHX55uCKLwRUnn
 1OqYdnF3oIrwFzfIY6mMAcY/u98GBDTTtQBLoNAlw+hvN4x2F/7OJBdxwhwxP67Yl91m
 HfQnfPufwSxrkY/EyHdMYPswFf5Afzz/u6xDX42zgw3lq0sHctkZGL7i5TT4Xm6c+SIx
 lUf4h1z10SnkUlfkTV7j+Zu+ACDzgirBKaFdl+aumoIhMu7hy/UZw4ijZ3FSu7haH1dy
 llDA==
X-Gm-Message-State: APjAAAWtt05fbSgt79q9gHC2WGB78eXLMydQIN4u7X0XbR1K3Q4F3Auv
 cDD+edKVewlhHo01/QNFClBzIKQRUQFofA==
X-Google-Smtp-Source: APXvYqyk9zpolT5nZUDrzxkvjKEKM09KwdXTSlbQAZsC6QJF6cjoJN2I51l6M7rp0vvBdEdXLFIJ6w==
X-Received: by 2002:ac8:70c:: with SMTP id g12mr15108701qth.151.1557258142555; 
 Tue, 07 May 2019 12:42:22 -0700 (PDT)
Received: from dhcp-10-20-1-11.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id l12sm10127435qta.82.2019.05.07.12.42.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 07 May 2019 12:42:22 -0700 (PDT)
Message-ID: <442a00cbc9fca8b8f58f1121f1bf145438c423cb.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org
Date: Tue, 07 May 2019 15:42:20 -0400
In-Reply-To: <20190504163219.8349-4-kherbst@redhat.com>
References: <20190504163219.8349-1-kherbst@redhat.com>
 <20190504163219.8349-4-kherbst@redhat.com>
Organization: Red Hat
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Subject: Re: [Nouveau] [PATCH 3/5] pci: add nvkm_pcie_get_speed
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

UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpPbiBTYXQsIDIwMTkt
MDUtMDQgYXQgMTg6MzIgKzAyMDAsIEthcm9sIEhlcmJzdCB3cm90ZToKPiBTaWduZWQtb2ZmLWJ5
OiBLYXJvbCBIZXJic3QgPGtoZXJic3RAcmVkaGF0LmNvbT4KPiAtLS0KPiAgZHJtL25vdXZlYXUv
aW5jbHVkZS9udmttL3N1YmRldi9wY2kuaCB8IDEgKwo+ICBkcm0vbm91dmVhdS9udmttL3N1YmRl
di9wY2kvcGNpZS5jICAgIHwgOCArKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0
aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcm0vbm91dmVhdS9pbmNsdWRlL252a20vc3ViZGV2
L3BjaS5oCj4gYi9kcm0vbm91dmVhdS9pbmNsdWRlL252a20vc3ViZGV2L3BjaS5oCj4gaW5kZXgg
MjM4MDNjYzguLjFmZGYzMDk4IDEwMDY0NAo+IC0tLSBhL2RybS9ub3V2ZWF1L2luY2x1ZGUvbnZr
bS9zdWJkZXYvcGNpLmgKPiArKysgYi9kcm0vbm91dmVhdS9pbmNsdWRlL252a20vc3ViZGV2L3Bj
aS5oCj4gQEAgLTUzLDQgKzUzLDUgQEAgaW50IGdwMTAwX3BjaV9uZXcoc3RydWN0IG52a21fZGV2
aWNlICosIGludCwgc3RydWN0Cj4gbnZrbV9wY2kgKiopOwo+ICAKPiAgLyogcGNpZSBmdW5jdGlv
bnMgKi8KPiAgaW50IG52a21fcGNpZV9zZXRfbGluayhzdHJ1Y3QgbnZrbV9wY2kgKiwgZW51bSBu
dmttX3BjaWVfc3BlZWQsIHU4IHdpZHRoKTsKPiArZW51bSBudmttX3BjaWVfc3BlZWQgbnZrbV9w
Y2llX2dldF9zcGVlZChzdHJ1Y3QgbnZrbV9wY2kgKik7Cj4gICNlbmRpZgo+IGRpZmYgLS1naXQg
YS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvcGNpZS5jCj4gYi9kcm0vbm91dmVhdS9udmtt
L3N1YmRldi9wY2kvcGNpZS5jCj4gaW5kZXggZDcxZTVkYjUuLmViNDA1ZGVhIDEwMDY0NAo+IC0t
LSBhL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9wY2llLmMKPiArKysgYi9kcm0vbm91dmVh
dS9udmttL3N1YmRldi9wY2kvcGNpZS5jCj4gQEAgLTE2MywzICsxNjMsMTEgQEAgbnZrbV9wY2ll
X3NldF9saW5rKHN0cnVjdCBudmttX3BjaSAqcGNpLCBlbnVtCj4gbnZrbV9wY2llX3NwZWVkIHNw
ZWVkLCB1OCB3aWR0aCkKPiAgCj4gIAlyZXR1cm4gcmV0Owo+ICB9Cj4gKwo+ICtlbnVtIG52a21f
cGNpZV9zcGVlZAo+ICtudmttX3BjaWVfZ2V0X3NwZWVkKHN0cnVjdCBudmttX3BjaSAqcGNpKQo+
ICt7Cj4gKwlpZiAoIXBjaSB8fCAhcGNpX2lzX3BjaWUocGNpLT5wZGV2KSB8fCAhcGNpLT5wY2ll
LmN1cl9zcGVlZCkKPiArCQlyZXR1cm4gLUVOT1NZUzsKPiArCXJldHVybiBwY2ktPmZ1bmMtPnBj
aWUuY3VyX3NwZWVkKHBjaSk7Cj4gK30KLS0gCkNoZWVycywKCUx5dWRlIFBhdWwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBs
aXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
