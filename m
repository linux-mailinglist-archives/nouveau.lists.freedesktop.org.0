Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB747D4A66
	for <lists+nouveau@lfdr.de>; Tue, 24 Oct 2023 10:37:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B43410E066;
	Tue, 24 Oct 2023 08:37:10 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B272710E066
 for <nouveau@lists.freedesktop.org>; Tue, 24 Oct 2023 08:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698136627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4uyeaGl1qvvQ1DXVC5deUUf8hRMLnWKjNS4QN+mU/5c=;
 b=SA5uY1XdYUjSy6K2AFexum2vnMI01O36HkuswiL50wqf5F+n46hJp8ZrG95pvXaXKU7B3q
 XR7FQqMqdjC9Miq0CQ8VEItcX/7f/XIxmfKqrPz2cVV/fwF5kuERHA7d0GeadgTP6ZyRLC
 oILbkQLWjukac5njjVSMdqk891QKlOs=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-394-KC7H3mgaOe-z8IRyesoKiw-1; Tue, 24 Oct 2023 04:37:05 -0400
X-MC-Unique: KC7H3mgaOe-z8IRyesoKiw-1
Received: by mail-yb1-f198.google.com with SMTP id
 3f1490d57ef6-d9cbe017d3bso1289882276.1
 for <nouveau@lists.freedesktop.org>; Tue, 24 Oct 2023 01:37:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698136625; x=1698741425;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4uyeaGl1qvvQ1DXVC5deUUf8hRMLnWKjNS4QN+mU/5c=;
 b=v5XdyLufjuNrpnRwlD2WmXj2YuS2I6RJ0f3b1VpbvNkymXShgAyz56Vw+4KV6YAkAM
 qiIYCXRShDTsYEyLthX1OD9WaNm5i7dHRla9rIDJ2DXSA/yEn120mVxnzxB69IHOcjHS
 8aDSjRTlq/5ZxVpUMom9aMgrAz0LOHblrR6d1nnp/Z2L+fSPr650FvaSG+aZ+aRc/a00
 YDMSqLseNY6xpJKLZHRkkMW5e5yeHpa1bD9sRv/y2RIyARniTvYRIgsmoIF5t6C/rgdG
 8YLHADdnIyeP00My/9jZtAJXqYx7VggyQ9r/C9RyFcLnC0lx2msFJk3kCyPduGYItXWx
 s5+g==
X-Gm-Message-State: AOJu0YyEY13xW0eZujn2mdukk1zze/NmJTdEQBqIQKHcLj+yJSDCGZSY
 7qQydkRPoYHyPXKDxJbgIVS4gqHipz23xo0hZtYG9qqE1xqzxnZ7u+2GUMUIR98JNIHmnBC50Iq
 gZqStFLj7pWc39s4qo383mhnMYg==
X-Received: by 2002:a0d:d5ca:0:b0:5a7:cf50:284f with SMTP id
 x193-20020a0dd5ca000000b005a7cf50284fmr10719703ywd.2.1698136625261; 
 Tue, 24 Oct 2023 01:37:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEaLPEUFblRYCHu59Pf+ywS/NjpYipSslo0CAHO9/8lSuc2IcSQC+LE3+w2fQCRpWX4CIWo7w==
X-Received: by 2002:a0d:d5ca:0:b0:5a7:cf50:284f with SMTP id
 x193-20020a0dd5ca000000b005a7cf50284fmr10719691ywd.2.1698136624987; 
 Tue, 24 Oct 2023 01:37:04 -0700 (PDT)
Received: from [10.32.64.210] (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 l67-20020a0dfb46000000b00598d67585d7sm3861196ywf.117.2023.10.24.01.37.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Oct 2023 01:37:04 -0700 (PDT)
Message-ID: <94809d4ad95df753e88230a9a8a36621b481d8c3.camel@redhat.com>
From: Philipp Stanner <pstanner@redhat.com>
To: Ben Skeggs <skeggsb@gmail.com>, nouveau@lists.freedesktop.org
Date: Tue, 24 Oct 2023 10:37:03 +0200
In-Reply-To: <20230918202149.4343-4-skeggsb@gmail.com>
References: <20230918202149.4343-1-skeggsb@gmail.com>
 <20230918202149.4343-4-skeggsb@gmail.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Subject: Re: [Nouveau] [PATCH 03/44] drm/nouveau/nvkm: bump maximum number
 of NVJPG
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
Cc: Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTA5LTE5IGF0IDA2OjIxICsxMDAwLCBCZW4gU2tlZ2dzIHdyb3RlOgo+IEZy
b206IEJlbiBTa2VnZ3MgPGJza2VnZ3NAcmVkaGF0LmNvbT4KPiAKPiBSTSAoYW5kIEdIMTAwKSBz
dXBwb3J0IDggTlZKUEcgaW5zdGFuY2VzLgoKSSBkb24ndCB0aGluayB0aGUgY29tbWl0IG1lc3Nh
Z2UgcHJvdmlkZXMgZW5vdWdoIGluZm9ybWF0aW9uLgpJbnN0aW5jdGl2ZWx5IEkgd291bGQgcmVh
ZCB0aGUgUk0gYXMgInJlbW92ZSIsIHRodXMgInJlbW92ZSBzdXBwb3J0Cltmb3JdIDggTlZKUEcg
aW5zdGFuY2VzIiA/Pz8KClR3byBzZW50ZW5jZXMgKHdpdGggdmVyYiBhbmQgb2JqZWN0KSB3b3Vs
ZCBiZSBoZWxwZnVsIGhlcmUsIG9uZQpkZXNjcmliaW5nIHRoZSBwcm9ibGVtIGJlaW5nIGFkZHJl
c3NlZCwgdGhlIG90aGVyIHdoYXQgdGhlIGNvbW1pdCBkb2VzLgoKUC4KCgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEJlbiBTa2VnZ3MgPGJza2VnZ3NAcmVkaGF0LmNvbT4KPiAtLS0KPiDCoGRyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L2luY2x1ZGUvbnZrbS9jb3JlL2xheW91dC5oIHwgMiArLQo+IMKgZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvdG9wL2dhMTAwLmPCoMKgwqAgfCAyICst
Cj4gwqBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi90b3AvZ2sxMDQuY8KgwqDC
oCB8IDIgKy0KPiDCoDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9pbmNsdWRlL252
a20vY29yZS9sYXlvdXQuaAo+IGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvaW5jbHVkZS9udmtt
L2NvcmUvbGF5b3V0LmgKPiBpbmRleCBmMzI2YjA5NjgwYmUuLjZhZjAzNTJhNDg3MyAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9pbmNsdWRlL252a20vY29yZS9sYXlvdXQu
aAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2luY2x1ZGUvbnZrbS9jb3JlL2xheW91
dC5oCj4gQEAgLTQ0LDcgKzQ0LDcgQEAgTlZLTV9MQVlPVVRfT05DRShOVktNX0VOR0lORV9NU1BQ
UMKgwqAgLCBzdHJ1Y3QKPiBudmttX2VuZ2luZcKgICzCoMKgwqAgbXNwcHApCj4gwqBOVktNX0xB
WU9VVF9PTkNFKE5WS01fRU5HSU5FX01TVkxEwqDCoCAsIHN0cnVjdCBudmttX2VuZ2luZcKgICzC
oMKgwqAKPiBtc3ZsZCkKPiDCoE5WS01fTEFZT1VUX0lOU1QoTlZLTV9FTkdJTkVfTlZERUPCoMKg
ICwgc3RydWN0IG52a21fbnZkZWPCoMKgICzCoMKgwqAKPiBudmRlYywgOCkKPiDCoE5WS01fTEFZ
T1VUX0lOU1QoTlZLTV9FTkdJTkVfTlZFTkPCoMKgICwgc3RydWN0IG52a21fbnZlbmPCoMKgICzC
oMKgwqAKPiBudmVuYywgMykKPiAtTlZLTV9MQVlPVVRfT05DRShOVktNX0VOR0lORV9OVkpQR8Kg
wqAgLCBzdHJ1Y3QgbnZrbV9lbmdpbmXCoCAswqDCoMKgCj4gbnZqcGcpCj4gK05WS01fTEFZT1VU
X0lOU1QoTlZLTV9FTkdJTkVfTlZKUEfCoMKgICwgc3RydWN0IG52a21fZW5naW5lwqAgLMKgwqDC
oAo+IG52anBnLCA4KQo+IMKgTlZLTV9MQVlPVVRfT05DRShOVktNX0VOR0lORV9PRkHCoMKgwqDC
oCAsIHN0cnVjdCBudmttX2VuZ2luZcKgICzCoMKgwqDCoMKgCj4gb2ZhKQo+IMKgTlZLTV9MQVlP
VVRfT05DRShOVktNX0VOR0lORV9QTcKgwqDCoMKgwqAgLCBzdHJ1Y3QgbnZrbV9wbcKgwqDCoMKg
wqAgLMKgwqDCoMKgwqDCoAo+IHBtKQo+IMKgTlZLTV9MQVlPVVRfT05DRShOVktNX0VOR0lORV9T
RUPCoMKgwqDCoCAsIHN0cnVjdCBudmttX2VuZ2luZcKgICzCoMKgwqDCoMKgCj4gc2VjKQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi90b3AvZ2ExMDAu
Ywo+IGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvdG9wL2dhMTAwLmMKPiBp
bmRleCA4NDc5MGNmNTJiOTAuLjRmYTZlMmYxOWJmZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9udmttL3N1YmRldi90b3AvZ2ExMDAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3RvcC9nYTEwMC5jCj4gQEAgLTc2LDcgKzc2LDcgQEAg
Z2ExMDBfdG9wX3BhcnNlKHN0cnVjdCBudmttX3RvcCAqdG9wKQo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgY2FzZSAweDAwMDAwMDEyOiBJXyhOVktNX1NVQkRFVl9JT0NUUkwsIGlu
c3QpOyBicmVhazsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNhc2UgMHgwMDAw
MDAxMzogSV8oTlZLTV9FTkdJTkVfQ0XCoMKgwqAgLCBpbnN0KTsgYnJlYWs7Cj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjYXNlIDB4MDAwMDAwMTQ6IE9fKE5WS01fU1VCREVWX0dT
UMKgwqAgLMKgwqDCoCAwKTsgYnJlYWs7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGNhc2UgMHgwMDAwMDAxNTogT18oTlZLTV9FTkdJTkVfTlZKUEcgLMKgwqDCoCAwKTsgYnJlYWs7
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNhc2UgMHgwMDAwMDAxNTogSV8oTlZL
TV9FTkdJTkVfTlZKUEcgLCBpbnN0KTsgYnJlYWs7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBjYXNlIDB4MDAwMDAwMTY6IE9fKE5WS01fRU5HSU5FX09GQcKgwqAgLMKgwqDCoCAw
KTsgYnJlYWs7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjYXNlIDB4MDAwMDAw
MTc6IE9fKE5WS01fU1VCREVWX0ZMQcKgwqAgLMKgwqDCoCAwKTsgYnJlYWs7Cj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3RvcC9nazEwNC5jCj4gYi9k
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi90b3AvZ2sxMDQuYwo+IGluZGV4IDJi
YmJhODI0NGNiZi4uMGYxNjc1ZTU3MjU2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L252a20vc3ViZGV2L3RvcC9nazEwNC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbnZrbS9zdWJkZXYvdG9wL2drMTA0LmMKPiBAQCAtODksNyArODksNyBAQCBnazEwNF90
b3BfcGFyc2Uoc3RydWN0IG52a21fdG9wICp0b3ApCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBjYXNlIDB4MDAwMDAwMTI6IElfKE5WS01fU1VCREVWX0lPQ1RSTCwgaW5zdCk7IGJy
ZWFrOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY2FzZSAweDAwMDAwMDEzOiBJ
XyhOVktNX0VOR0lORV9DRcKgwqDCoCAsIGluc3QpOyBicmVhazsKPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGNhc2UgMHgwMDAwMDAxNDogT18oTlZLTV9TVUJERVZfR1NQwqDCoCAs
wqDCoMKgIDApOyBicmVhazsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY2FzZSAw
eDAwMDAwMDE1OiBPXyhOVktNX0VOR0lORV9OVkpQRyAswqDCoMKgIDApOyBicmVhazsKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY2FzZSAweDAwMDAwMDE1OiBJXyhOVktNX0VOR0lO
RV9OVkpQRyAsIGluc3QpOyBicmVhazsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGRlZmF1bHQ6Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgYnJlYWs7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9Cgo=

