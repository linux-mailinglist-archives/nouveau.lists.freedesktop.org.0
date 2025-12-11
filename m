Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D06FCB73D2
	for <lists+nouveau@lfdr.de>; Thu, 11 Dec 2025 23:00:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA6B310E2FF;
	Thu, 11 Dec 2025 22:00:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dgbk7UJk";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DBA510E2FF
 for <nouveau@lists.freedesktop.org>; Thu, 11 Dec 2025 22:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765490403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Njpx3Qs/b8QhZqkiJZ4Nes8q7O8NERYYeiceOSzlB/g=;
 b=dgbk7UJkU8a4W3YVKCC4lO7PZXDjslg3mWQQCarjyFD1sENx8zO7c7YP8ug3jL2rPUQ1Hu
 Js7bY9JVD4iXVpYr2GmARl/Yrw/gGDGAIexpQE1G9TkNaaOsKuqMaqkA6iIlp1tjyss/op
 Py1ei8lntHiCF30J5cnGjd//ZpxKQek=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-RBiI4o6WN5aV_nLiG0RcYg-1; Thu, 11 Dec 2025 17:00:01 -0500
X-MC-Unique: RBiI4o6WN5aV_nLiG0RcYg-1
X-Mimecast-MFC-AGG-ID: RBiI4o6WN5aV_nLiG0RcYg_1765490401
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b24a25cff5so142847885a.2
 for <nouveau@lists.freedesktop.org>; Thu, 11 Dec 2025 14:00:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765490401; x=1766095201;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Njpx3Qs/b8QhZqkiJZ4Nes8q7O8NERYYeiceOSzlB/g=;
 b=Drbbd7CpN7boQlDHhKMiC9ndb1Z8ODSEaK5vQLF4y4tX8PuujtlRmOPD6xIk+t5xvP
 vvFSZ1J5I3keAbzjegAbNg19OCpoN6esHb96ZMF9Mc4OkiZyXuoEPiQaeM9j9DHryyD+
 zJampp2gAc7RoQCj+zMQb4nFVw9IoBtMQ9Ock5x/pvPE7ahQXTX58flK9Gjc23VOULH1
 y42cOPvvlf4kAldHeQfNwGWz66nGPzxU7hGZXRh1tQxZFGxdKdY41ZuyR4iQM1IGRCAx
 hGuhQmBg/4SV50dRixnn0/2CLovi4aGzO1vwpj9NSGv5OwXg1zALMBql+Esi+8C6Vosn
 IRBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGN6caZx2eUKTC8MqM1yaszMxxZ5bBwSbCb1QWiKgGqoBeeu9vn62hezbl2KqP0hne0pDYRT/H@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwoKsGf5tmhGHxNGuDM/9hyBBH6HrcFJ5MUWhSRl0WxendQT+os
 gz9pWvXwDRQaeXp03JsUab4kWIUomVcFg8oreVWPTXNy1/yANbez16lYdB6pWLAtYEXY80HgJtZ
 AyHiW6d2jJFfLGAl1HPgndNMFFlmJny58wHQqUcSBF7R3TAgw2bGLCU9WaHbyRlYVJ2s=
X-Gm-Gg: AY/fxX5oxjJTolZy+/26EJHX3ES0AcnXMTxDwa/Q70R26gWe2DWjVlzpGOUGG+I2gvS
 WftgRexqciOt5mM3a/yo2AC0tomatqcEUN+E4lwyDwqfUUpnOfyX+na6t4TH5Y39tjThOPqevdL
 /PRdT1z5HCh1jrwDvTjFGYS4KYvlLX3HJAyvfxHuRa5EqTBc9DnoTnKFgZ+jMdXoQpw46q6EMOG
 IS72QSUB45S3AGEgjcVCiTvNOCTbY+T7BgiP2NzvmZZ+tE9S2Dq5rs9JM1uOIodV2AoWG1r2w1z
 S8FfwGfo/XYrASNwLrJWd3dtqh5zfzVrOBzVe2TMT5Zt2658aMOZGOtafFi9UWIozVsiNXf1D8i
 iDRviFkLvO9lrgNtxxZiVUqU68VnP0ffGQ3le7NyBghJRfh4oE+9HXBM=
X-Received: by 2002:a05:620a:1a86:b0:8b2:f82f:c630 with SMTP id
 af79cd13be357-8bb39eb98b0mr5406785a.31.1765490401351; 
 Thu, 11 Dec 2025 14:00:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFcD/u3yfUht3fNeXEQhIUzrD0ydpAz9Hqu2OLR8JqXNXRjerBGXVTk8n11MJKpUQer50n6Fw==
X-Received: by 2002:a05:620a:1a86:b0:8b2:f82f:c630 with SMTP id
 af79cd13be357-8bb39eb98b0mr5403685a.31.1765490400979; 
 Thu, 11 Dec 2025 14:00:00 -0800 (PST)
Received: from [192.168.8.198] (pool-100-0-77-142.bstnma.fios.verizon.net.
 [100.0.77.142]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8bab544b657sm312470285a.10.2025.12.11.13.59.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 14:00:00 -0800 (PST)
Message-ID: <d47f7ca5afe8b53f63d91743323d152fe063ba86.camel@redhat.com>
Subject: Re: [PATCH 1/9] gpu: nova-core: gsp: warn if data remains after
 processing a message
From: lyude@redhat.com
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich
 <dakr@kernel.org>,  Alice Ryhl <aliceryhl@google.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>,  Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi
 <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Date: Thu, 11 Dec 2025 16:59:59 -0500
In-Reply-To: <20251208-nova-misc-v1-1-a3ce01376169@nvidia.com>
References: <20251208-nova-misc-v1-0-a3ce01376169@nvidia.com>
 <20251208-nova-misc-v1-1-a3ce01376169@nvidia.com>
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 738MRBbfDjxB44zoyUI6HLHnBSXMgJou3d34GJTmDYE_1765490401
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
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

UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpPbiBNb24sIDIwMjUt
MTItMDggYXQgMTg6MjYgKzA5MDAsIEFsZXhhbmRyZSBDb3VyYm90IHdyb3RlOgo+IE5vdCBwcm9j
ZXNzaW5nIHRoZSB3aG9sZSBkYXRhIGZyb20gYSByZWNlaXZlZCBtZXNzYWdlIGlzIGEgc3Ryb25n
Cj4gaW5kaWNhdG9yIG9mIGEgYnVnIC0gZW1pdCBhIHdhcm5pbmcgd2hlbiBzdWNoIGNhc2VzIGFy
ZSBkZXRlY3RlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgQ291cmJvdCA8YWNvdXJi
b3RAbnZpZGlhLmNvbT4KPiAtLS0KPiDCoGRyaXZlcnMvZ3B1L25vdmEtY29yZS9nc3AvY21kcS5y
cyB8IDEyICsrKysrKysrKysrLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvbm92YS1jb3JlL2dz
cC9jbWRxLnJzIGIvZHJpdmVycy9ncHUvbm92YS0KPiBjb3JlL2dzcC9jbWRxLnJzCj4gaW5kZXgg
ZGFiNzMzNzdjNTI2Li41Y2U4NWVlMWZmY2UgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvbm92
YS1jb3JlL2dzcC9jbWRxLnJzCj4gKysrIGIvZHJpdmVycy9ncHUvbm92YS1jb3JlL2dzcC9jbWRx
LnJzCj4gQEAgLTY2Miw3ICs2NjIsMTcgQEAgcHViKGNyYXRlKSBmbiByZWNlaXZlX21zZzxNOgo+
IE1lc3NhZ2VGcm9tR3NwPigmbXV0IHNlbGYsIHRpbWVvdXQ6IERlbHRhKSAtPiBSZXN1bAo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsZXQgKGNtZCwgY29udGVudHNfMSkgPQo+IE06Ok1lc3Nh
Z2U6OmZyb21fYnl0ZXNfcHJlZml4KG1lc3NhZ2UuY29udGVudHMuMCkub2tfb3IoRUlPKT87Cj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxldCBtdXQgc2J1ZmZlciA9IFNCdWZmZXJJdGVyOjpu
ZXdfcmVhZGVyKFtjb250ZW50c18xLAo+IG1lc3NhZ2UuY29udGVudHMuMV0pOwo+IMKgCj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgTTo6cmVhZChjbWQsICZtdXQgc2J1ZmZlcikubWFwX2Vycih8
ZXwgZS5pbnRvKCkpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGV0IHJlcyA9IE06OnJlYWQo
Y21kLCAmbXV0IHNidWZmZXIpLm1hcF9lcnIofGV8Cj4gZS5pbnRvKCkpOwo+ICsKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBpZiByZXMuaXNfb2soKSAmJiAhc2J1ZmZlci5pc19lbXB0eSgpIHsK
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl93YXJuISgKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJnNlbGYuZGV2LAo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiR1NQIG1lc3NhZ2Ugezo/fSBoYXMgdW5wcm9jZXNz
ZWQgZGF0YVxuIiwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZnVu
Y3Rpb24KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICk7Cj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfQo+ICsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXMKPiDCoMKgwqDC
oMKgwqDCoMKgIH0gZWxzZSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEVycihFUkFOR0Up
Cj4gwqDCoMKgwqDCoMKgwqDCoCB9Owo=

