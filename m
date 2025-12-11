Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D311ECB73F9
	for <lists+nouveau@lfdr.de>; Thu, 11 Dec 2025 23:04:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52F0110E6D0;
	Thu, 11 Dec 2025 22:04:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dL1lSwFr";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC1F210E5A7
 for <nouveau@lists.freedesktop.org>; Thu, 11 Dec 2025 22:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765490644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ox0xCAebVCB95PbU+gdxMPdg3qP0JLOdxS4EeOBLbV8=;
 b=dL1lSwFrOk06l+xHbNUMHVBO++TjcPobv7WPh7pt1D0MHC8qkYl0+rH1N7VfpDq4yvnHYe
 Asp/h/vN+t2rIzKtIPS12Wja1SidguhYD25o5YtLjLUd/S7ff835Q3Eo61hGeFAUshnRg5
 d7IydZuu7E3bxiGmIPkW8LlEk42hAzw=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-I01joloaNw-i3X5tTcsOHw-1; Thu, 11 Dec 2025 17:04:02 -0500
X-MC-Unique: I01joloaNw-i3X5tTcsOHw-1
X-Mimecast-MFC-AGG-ID: I01joloaNw-i3X5tTcsOHw_1765490642
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8ba026720eeso117335885a.1
 for <nouveau@lists.freedesktop.org>; Thu, 11 Dec 2025 14:04:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765490642; x=1766095442;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ox0xCAebVCB95PbU+gdxMPdg3qP0JLOdxS4EeOBLbV8=;
 b=GCmVUFO26p5Z1WBOBhV4m5FzPcmTh8ED+Q6WMKSmn2stvX2sj3f9trs5cGoYg5pdnW
 u4ykfRI33PnlgcXixHKD4zvJq6Tyf8YqSh6KLXwHTadM80OBgaKRuI/YqfpDd5UDAxwf
 9g20crl/AhQzmkCPu8k9154bX70sSMKgA96r/qIXgzD3a5et1VQAtoZkpdnmB7P0L0mB
 rHWNI4koUJBF2CY0JgHricicIL5S30W4y7fhaS0h5rPSmNKHSF+Cg6aOR6U7iqbwaiIp
 Yx9rZohzr+oFrgt9cS7zfEO8jaZjHMsOO/4zCE5UHQlJS9pQ4harUvcsrfq+BZm9O9A9
 MWwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5GSTi/yxMEDPYSKzNrZwDBfaXy1etuRNMIPSVjOb8lWaKzSIcQU5FPmqXC4JucZkkQfrbUcFs@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9swTaAhEGbQO9BzSLfx9yYEt2ZJNBSbF+DcdgP5tUKYXxxx4k
 vbUpiWveEB0aLFo9p6CkMojO7Uh5K83IQd+81gTcAt6HO0yYFlIyCSv/QuUSXpycQ7pnk4ojJCE
 PviGkC66bE3fRNWYjK9FrzvkggSti+Oc5RUKq5de3DGBJhMG903+o7NyIDWw31XPKrQI=
X-Gm-Gg: AY/fxX7FAYItQDnWWBpwNMaWJzZTTV6l7naHgRTBM4JRUgV7art3UPUppaCFi52MjBy
 ig+eOq6PGpLcVawn6F+39Qqt6OJgeY4XO2pTx0ALbIHPU7KmsYU1g9KmRCk5VOMcrIkmp7vY38h
 0vjdFomEoWKhZz02KFb1JUVTqxDAvu/Yw7ALnOHYrUIUjPINUV0pWfWMAXYe8PsL7pz+OOpJpO6
 vEhoCDGjilQnubopIqpWR74LqHG0TuV4DCb543CvkExcejqPFxxkuiPxaxTIrMiO17u0gRFQYi5
 SScL63fYmUTWab6NwWY6dx7Lv6KTJqeOCBZ+za5RUxL51zDxRPTo9Hem+tJh5Ldb3RIH3ULULlt
 g/HrJKuBM21+cZiE4g5uCWm6ZIZxCJ5X97D4fRpLiJHyYch/C92XVYTA=
X-Received: by 2002:a05:620a:2912:b0:8b2:de6a:ca with SMTP id
 af79cd13be357-8bb3a253e10mr5299185a.52.1765490642228; 
 Thu, 11 Dec 2025 14:04:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG4dSZ+TQJmQSc9zvEmOhUZuUFMnzLXfJW8dtUKjPgR0V6/aFOu8dFcWoKAj/pYO/72lCdbGg==
X-Received: by 2002:a05:620a:2912:b0:8b2:de6a:ca with SMTP id
 af79cd13be357-8bb3a253e10mr5292785a.52.1765490641777; 
 Thu, 11 Dec 2025 14:04:01 -0800 (PST)
Received: from [192.168.8.198] (pool-100-0-77-142.bstnma.fios.verizon.net.
 [100.0.77.142]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8bab566608asm314452685a.21.2025.12.11.14.04.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 14:04:01 -0800 (PST)
Message-ID: <8482d73df0a6b3a5cbddf5381e9bb8b261190fae.camel@redhat.com>
Subject: Re: [PATCH 3/9] gpu: nova-core: gsp: simplify sequencer opcode parsing
From: lyude@redhat.com
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich
 <dakr@kernel.org>,  Alice Ryhl <aliceryhl@google.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>,  Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi
 <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Date: Thu, 11 Dec 2025 17:04:00 -0500
In-Reply-To: <20251208-nova-misc-v1-3-a3ce01376169@nvidia.com>
References: <20251208-nova-misc-v1-0-a3ce01376169@nvidia.com>
 <20251208-nova-misc-v1-3-a3ce01376169@nvidia.com>
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EsBr8m8aqSc-eEWwsCIuaXlQjfEyng4GK1MNcfwvejw_1765490642
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
MTItMDggYXQgMTg6MjYgKzA5MDAsIEFsZXhhbmRyZSBDb3VyYm90IHdyb3RlOgo+IFRoZSBvcGNv
ZGVzIGFyZSBhbHJlYWR5IHRoZSByaWdodCB0eXBlIGluIHRoZSBDIHVuaW9uLCBzbyB3ZSBjYW4g
dXNlCj4gdGhlbSBkaXJlY3RseSBpbnN0ZWFkIG9mIGNvbnZlcnRpbmcgdGhlbSB0byBhIGJ5dGUg
c3RyZWFtIGFuZCBiYWNrCj4gYWdhaW4KPiB1c2luZyBgRnJvbUJ5dGVzYC4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBBbGV4YW5kcmUgQ291cmJvdCA8YWNvdXJib3RAbnZpZGlhLmNvbT4KPiAtLS0KPiDC
oGRyaXZlcnMvZ3B1L25vdmEtY29yZS9nc3AvZncucnMgfCA0MCArKysrKy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCj4gLS0tLS0tLS0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25z
KCspLCAzNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvbm92YS1j
b3JlL2dzcC9mdy5ycyBiL2RyaXZlcnMvZ3B1L25vdmEtCj4gY29yZS9nc3AvZncucnMKPiBpbmRl
eCAyNGU0ZWFhZjEyNjUuLmQwNmMwZmRkNjE1NCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9u
b3ZhLWNvcmUvZ3NwL2Z3LnJzCj4gKysrIGIvZHJpdmVycy9ncHUvbm92YS1jb3JlL2dzcC9mdy5y
cwo+IEBAIC00NzIsMTMgKzQ3Miw3IEBAIHB1YihjcmF0ZSkgZm4gcmVnX3dyaXRlX3BheWxvYWQo
JnNlbGYpIC0+Cj4gUmVzdWx0PFJlZ1dyaXRlUGF5bG9hZD4gewo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCByZXR1cm4gRXJyKEVJTlZBTCk7Cj4gwqDCoMKgwqDCoMKgwqDCoCB9Cj4gwqDCoMKg
wqDCoMKgwqDCoCAvLyBTQUZFVFk6IE9wY29kZSBpcyB2ZXJpZmllZCB0byBiZSBgUmVnV3JpdGVg
LCBzbyB1bmlvbgo+IGNvbnRhaW5zIHZhbGlkIGBSZWdXcml0ZVBheWxvYWRgLgo+IC3CoMKgwqDC
oMKgwqDCoCBsZXQgcGF5bG9hZF9ieXRlcyA9IHVuc2FmZSB7Cj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgY29yZTo6c2xpY2U6OmZyb21fcmF3X3BhcnRzKAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAKPiBjb3JlOjpwdHI6OmFkZHJfb2YhKHNlbGYuMC5wYXlsb2FkLnJlZ1dyaXRl
KS5jYXN0Ojo8dTg+KCksCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb3JlOjpt
ZW06OnNpemVfb2Y6OjxSZWdXcml0ZVBheWxvYWQ+KCksCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgKQo+IC3CoMKgwqDCoMKgwqDCoCB9Owo+IC3CoMKgwqDCoMKgwqDCoAo+IE9rKCpSZWdXcml0
ZVBheWxvYWQ6OmZyb21fYnl0ZXMocGF5bG9hZF9ieXRlcykub2tfb3IoRUlOVkFMKT8pCj4gK8Kg
wqDCoMKgwqDCoMKgIE9rKFJlZ1dyaXRlUGF5bG9hZCh1bnNhZmUgeyBzZWxmLjAucGF5bG9hZC5y
ZWdXcml0ZSB9KSkKPiDCoMKgwqDCoCB9Cj4gwqAKPiDCoMKgwqDCoCAvLy8gUmV0dXJucyB0aGUg
cmVnaXN0ZXIgbW9kaWZ5IHBheWxvYWQgYnkgdmFsdWUuCj4gQEAgLTQ4OSwxMyArNDgzLDcgQEAg
cHViKGNyYXRlKSBmbiByZWdfbW9kaWZ5X3BheWxvYWQoJnNlbGYpIC0+Cj4gUmVzdWx0PFJlZ01v
ZGlmeVBheWxvYWQ+IHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIEVycihFSU5W
QUwpOwo+IMKgwqDCoMKgwqDCoMKgwqAgfQo+IMKgwqDCoMKgwqDCoMKgwqAgLy8gU0FGRVRZOiBP
cGNvZGUgaXMgdmVyaWZpZWQgdG8gYmUgYFJlZ01vZGlmeWAsIHNvIHVuaW9uCj4gY29udGFpbnMg
dmFsaWQgYFJlZ01vZGlmeVBheWxvYWRgLgo+IC3CoMKgwqDCoMKgwqDCoCBsZXQgcGF5bG9hZF9i
eXRlcyA9IHVuc2FmZSB7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29yZTo6c2xpY2U6OmZy
b21fcmF3X3BhcnRzKAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAKPiBjb3JlOjpw
dHI6OmFkZHJfb2YhKHNlbGYuMC5wYXlsb2FkLnJlZ01vZGlmeSkuY2FzdDo6PHU4PigpLAo+IC3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29yZTo6bWVtOjpzaXplX29mOjo8UmVnTW9k
aWZ5UGF5bG9hZD4oKSwKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCApCj4gLcKgwqDCoMKgwqDC
oMKgIH07Cj4gLcKgwqDCoMKgwqDCoMKgCj4gT2soKlJlZ01vZGlmeVBheWxvYWQ6OmZyb21fYnl0
ZXMocGF5bG9hZF9ieXRlcykub2tfb3IoRUlOVkFMKT8pCj4gK8KgwqDCoMKgwqDCoMKgIE9rKFJl
Z01vZGlmeVBheWxvYWQodW5zYWZlIHsgc2VsZi4wLnBheWxvYWQucmVnTW9kaWZ5IH0pKQo+IMKg
wqDCoMKgIH0KPiDCoAo+IMKgwqDCoMKgIC8vLyBSZXR1cm5zIHRoZSByZWdpc3RlciBwb2xsIHBh
eWxvYWQgYnkgdmFsdWUuCj4gQEAgLTUwNiwxMyArNDk0LDcgQEAgcHViKGNyYXRlKSBmbiByZWdf
cG9sbF9wYXlsb2FkKCZzZWxmKSAtPgo+IFJlc3VsdDxSZWdQb2xsUGF5bG9hZD4gewo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gRXJyKEVJTlZBTCk7Cj4gwqDCoMKgwqDCoMKgwqDC
oCB9Cj4gwqDCoMKgwqDCoMKgwqDCoCAvLyBTQUZFVFk6IE9wY29kZSBpcyB2ZXJpZmllZCB0byBi
ZSBgUmVnUG9sbGAsIHNvIHVuaW9uCj4gY29udGFpbnMgdmFsaWQgYFJlZ1BvbGxQYXlsb2FkYC4K
PiAtwqDCoMKgwqDCoMKgwqAgbGV0IHBheWxvYWRfYnl0ZXMgPSB1bnNhZmUgewo+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGNvcmU6OnNsaWNlOjpmcm9tX3Jhd19wYXJ0cygKPiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgCj4gY29yZTo6cHRyOjphZGRyX29mIShzZWxmLjAucGF5bG9h
ZC5yZWdQb2xsKS5jYXN0Ojo8dTg+KCksCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBjb3JlOjptZW06OnNpemVfb2Y6OjxSZWdQb2xsUGF5bG9hZD4oKSwKPiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCApCj4gLcKgwqDCoMKgwqDCoMKgIH07Cj4gLcKgwqDCoMKgwqDCoMKgCj4gT2so
KlJlZ1BvbGxQYXlsb2FkOjpmcm9tX2J5dGVzKHBheWxvYWRfYnl0ZXMpLm9rX29yKEVJTlZBTCk/
KQo+ICvCoMKgwqDCoMKgwqDCoCBPayhSZWdQb2xsUGF5bG9hZCh1bnNhZmUgeyBzZWxmLjAucGF5
bG9hZC5yZWdQb2xsIH0pKQo+IMKgwqDCoMKgIH0KPiDCoAo+IMKgwqDCoMKgIC8vLyBSZXR1cm5z
IHRoZSBkZWxheSBwYXlsb2FkIGJ5IHZhbHVlLgo+IEBAIC01MjMsMTMgKzUwNSw3IEBAIHB1Yihj
cmF0ZSkgZm4gZGVsYXlfdXNfcGF5bG9hZCgmc2VsZikgLT4KPiBSZXN1bHQ8RGVsYXlVc1BheWxv
YWQ+IHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIEVycihFSU5WQUwpOwo+IMKg
wqDCoMKgwqDCoMKgwqAgfQo+IMKgwqDCoMKgwqDCoMKgwqAgLy8gU0FGRVRZOiBPcGNvZGUgaXMg
dmVyaWZpZWQgdG8gYmUgYERlbGF5VXNgLCBzbyB1bmlvbgo+IGNvbnRhaW5zIHZhbGlkIGBEZWxh
eVVzUGF5bG9hZGAuCj4gLcKgwqDCoMKgwqDCoMKgIGxldCBwYXlsb2FkX2J5dGVzID0gdW5zYWZl
IHsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb3JlOjpzbGljZTo6ZnJvbV9yYXdfcGFydHMo
Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoAo+IGNvcmU6OnB0cjo6YWRkcl9vZiEo
c2VsZi4wLnBheWxvYWQuZGVsYXlVcykuY2FzdDo6PHU4PigpLAo+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgY29yZTo6bWVtOjpzaXplX29mOjo8RGVsYXlVc1BheWxvYWQ+KCksCj4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKQo+IC3CoMKgwqDCoMKgwqDCoCB9Owo+IC3CoMKgwqDC
oMKgwqDCoAo+IE9rKCpEZWxheVVzUGF5bG9hZDo6ZnJvbV9ieXRlcyhwYXlsb2FkX2J5dGVzKS5v
a19vcihFSU5WQUwpPykKPiArwqDCoMKgwqDCoMKgwqAgT2soRGVsYXlVc1BheWxvYWQodW5zYWZl
IHsgc2VsZi4wLnBheWxvYWQuZGVsYXlVcyB9KSkKPiDCoMKgwqDCoCB9Cj4gwqAKPiDCoMKgwqDC
oCAvLy8gUmV0dXJucyB0aGUgcmVnaXN0ZXIgc3RvcmUgcGF5bG9hZCBieSB2YWx1ZS4KPiBAQCAt
NTQwLDEzICs1MTYsNyBAQCBwdWIoY3JhdGUpIGZuIHJlZ19zdG9yZV9wYXlsb2FkKCZzZWxmKSAt
Pgo+IFJlc3VsdDxSZWdTdG9yZVBheWxvYWQ+IHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIEVycihFSU5WQUwpOwo+IMKgwqDCoMKgwqDCoMKgwqAgfQo+IMKgwqDCoMKgwqDCoMKg
wqAgLy8gU0FGRVRZOiBPcGNvZGUgaXMgdmVyaWZpZWQgdG8gYmUgYFJlZ1N0b3JlYCwgc28gdW5p
b24KPiBjb250YWlucyB2YWxpZCBgUmVnU3RvcmVQYXlsb2FkYC4KPiAtwqDCoMKgwqDCoMKgwqAg
bGV0IHBheWxvYWRfYnl0ZXMgPSB1bnNhZmUgewo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNv
cmU6OnNsaWNlOjpmcm9tX3Jhd19wYXJ0cygKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgCj4gY29yZTo6cHRyOjphZGRyX29mIShzZWxmLjAucGF5bG9hZC5yZWdTdG9yZSkuY2FzdDo6
PHU4PigpLAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29yZTo6bWVtOjpzaXpl
X29mOjo8UmVnU3RvcmVQYXlsb2FkPigpLAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgICkKPiAt
wqDCoMKgwqDCoMKgwqAgfTsKPiAtwqDCoMKgwqDCoMKgwqAKPiBPaygqUmVnU3RvcmVQYXlsb2Fk
Ojpmcm9tX2J5dGVzKHBheWxvYWRfYnl0ZXMpLm9rX29yKEVJTlZBTCk/KQo+ICvCoMKgwqDCoMKg
wqDCoCBPayhSZWdTdG9yZVBheWxvYWQodW5zYWZlIHsgc2VsZi4wLnBheWxvYWQucmVnU3RvcmUg
fSkpCj4gwqDCoMKgwqAgfQo+IMKgfQo+IMKgCg==

