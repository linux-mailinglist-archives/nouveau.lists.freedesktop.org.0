Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B8A342385
	for <lists+nouveau@lfdr.de>; Fri, 19 Mar 2021 18:41:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD2946EA69;
	Fri, 19 Mar 2021 17:40:59 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4AC66EA65
 for <nouveau@lists.freedesktop.org>; Fri, 19 Mar 2021 17:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616175656;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2lyYxlcYDfbe20htNVWw8hKQ3khGI6IDprziCpAFtxM=;
 b=dGoU2vBtGCjSVvAuyu0vm3CbZe2KqKwMbI42HHdBHKvSewsGjSk0WbLXyz/V3yRUXzhqrB
 aGFdFHiYnNEIEJ+T6rdmpaEPCAUW18xSm89tD1hCs4+C8d4MRoxjhzBfu0h4jmNL77PC6g
 kZWset7fgd0ZnxNYP1U75/9h8D/WB+Y=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-NBIoF_KQOBiU6TRxBohPNw-1; Fri, 19 Mar 2021 13:40:54 -0400
X-MC-Unique: NBIoF_KQOBiU6TRxBohPNw-1
Received: by mail-qv1-f69.google.com with SMTP id x20so23402258qvd.21
 for <nouveau@lists.freedesktop.org>; Fri, 19 Mar 2021 10:40:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=2lyYxlcYDfbe20htNVWw8hKQ3khGI6IDprziCpAFtxM=;
 b=q6naDS3K1MVLeK6UyeV/IQAjxj9TVFoba7FJBiPSabB2dOq/wmQtvO1cqyKUzuIHbJ
 KRTerQYXjLjgap1s95VAiC6WKPsIbuV8NQFR9MU1tA101fvj43NnKnqgacHK+2F0tXTT
 7TKVMv1DNtHOtSvFqfTCd4H6KSo4v3aksKFUP75OJSFgG7jnWOUXAc+PmpB6QY0kNg00
 9RBXcvDURVNwSKScF/1+Ipjq6L5wOO6ANyVXc1VZGeypXNHssp9F8m/mBDEu973rkQ1f
 wj2JuSazDwKi2M7mChB6lw2S5DmesLc3mhOggL3878EP0zb6FLFNmc7sU7FHAsQKnN8S
 VkkA==
X-Gm-Message-State: AOAM53039tLsG6iQItGewMsRc55t7wYi5AuMrlgc6xJ98zWJoGpQ7yOn
 RyXMlxJetx+PujHYo/SiTXE1d0s/Xv7VGIm8YG4fe3UkgbjpMMNVg0BbqmCb2Aj6NX316ExlDg3
 UkZ7X80GZOhU3ftOnpSaldxCXuQ==
X-Received: by 2002:a05:6214:1c45:: with SMTP id
 if5mr10516880qvb.9.1616175653638; 
 Fri, 19 Mar 2021 10:40:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmwon3DT22Tuf53mbRFXOTMxRULOjtbX1jnzgDuKdKickv7RlUb1B6eHS7LkgPREEMMgyMHg==
X-Received: by 2002:a05:6214:1c45:: with SMTP id
 if5mr10516860qvb.9.1616175653412; 
 Fri, 19 Mar 2021 10:40:53 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id 61sm4241432qtb.53.2021.03.19.10.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 10:40:52 -0700 (PDT)
Message-ID: <19ee182cd7965f3a250062dac927eccc7ae31a91.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Date: Fri, 19 Mar 2021 13:40:52 -0400
In-Reply-To: <YFS8vuuArWJtH9Mb@intel.com>
References: <20210318222124.970997-1-lyude@redhat.com>
 <20210318222124.970997-2-lyude@redhat.com> <YFS8vuuArWJtH9Mb@intel.com>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [igt-dev] [PATCH i-g-t v2 1/2] tests/kms_cursor_crc:
 Probe kernel for cursor size support
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
Reply-To: lyude@redhat.com
Cc: igt-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIxLTAzLTE5IGF0IDE3OjAxICswMjAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
Cj4gT24gVGh1LCBNYXIgMTgsIDIwMjEgYXQgMDY6MjE6MjNQTSAtMDQwMCwgTHl1ZGUgd3JvdGU6
Cj4gPiBGcm9tOiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgo+ID4gCj4gPiBDdXJyZW50
bHkgd2UganVzdCBhc3N1bWUgdGhhdCBldmVyeSBjdXJzb3Igc2l6ZSB1cCB0byBkYXRhLT5jdXJz
b3JfbWF4X3cvaAo+ID4gd2lsbAo+ID4gYmUgc3VwcG9ydGVkIGJ5IHRoZSBkcml2ZXIsIGFuZCBj
aGVjayBmb3Igc3VwcG9ydCBvZiBub25zcXVhcmUgY3Vyc29ycyBieQo+ID4gY2hlY2tpbmcgaWYg
d2UncmUgcnVubmluZyBvbiB1ODE1IGFuZCBpZiBzbywgd2hpY2ggdmFyaWFudCBvZiBpbnRlbCBo
YXJkd2FyZQo+ID4gd2UncmUgcnVubmluZyBvbi4gVGhpcyBpc24ndCByZWFsbHkgaWRlYWwgYXMg
d2UncmUgYWJvdXQgdG8gZW5hYmxlIDMyeDMyCj4gPiBjdXJzb3IKPiA+IHNpemUgdGVzdHMgZm9y
IG5vdXZlYXUsIGFuZCBJbnRlbCBoYXJkd2FyZSBkb2Vzbid0IHN1cHBvcnQgY3Vyc29yIHNpemVz
IHRoYXQKPiA+IHNtYWxsLgo+ID4gCj4gPiBTbywgZml4IHRoaXMgYnkgcmVtb3ZpbmcgaGFzX25v
bnNxdWFyZV9jdXJzb3JzKCkgYW5kIHJlcGxhY2luZyBpdCB3aXRoIGEKPiA+IG1vcmUKPiA+IGdl
bmVyaWMgcmVxdWlyZV9jdXJzb3Jfc2l6ZSgpIGZ1bmN0aW9uIHdoaWNoIGNoZWNrcyB3aGV0aGVy
IG9yIG5vdCB0aGUKPiA+IGRyaXZlcgo+ID4gd2UncmUgdXNpbmcgc3VwcG9ydHMgYSBnaXZlbiBj
dXJzb3Igc2l6ZSBieSBhdHRlbXB0aW5nIGEgdGVzdC1vbmx5IGF0b21pYwo+ID4gY29tbWl0Lgo+
ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgo+ID4g
Q2M6IE1hcnRpbiBQZXJlcyA8bWFydGluLnBlcmVzQGZyZWUuZnI+Cj4gPiBDYzogQmVuIFNrZWdn
cyA8YnNrZWdnc0ByZWRoYXQuY29tPgo+ID4gQ2M6IEplcmVteSBDbGluZSA8amNsaW5lQHJlZGhh
dC5jb20+Cj4gPiAtLS0KPiA+IMKgdGVzdHMva21zX2N1cnNvcl9jcmMuYyB8IDEzMSArKysrKysr
KysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwg
NzYgaW5zZXJ0aW9ucygrKSwgNTUgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS90
ZXN0cy9rbXNfY3Vyc29yX2NyYy5jIGIvdGVzdHMva21zX2N1cnNvcl9jcmMuYwo+ID4gaW5kZXgg
MzU0MWVhMDYuLmI5YzA1NDcyIDEwMDY0NAo+ID4gLS0tIGEvdGVzdHMva21zX2N1cnNvcl9jcmMu
Ywo+ID4gKysrIGIvdGVzdHMva21zX2N1cnNvcl9jcmMuYwo+ID4gQEAgLTUyMywyNiArNTIzLDQz
IEBAIHN0YXRpYyB2b2lkIGNyZWF0ZV9jdXJzb3JfZmIoZGF0YV90ICpkYXRhLCBpbnQgY3VyX3cs
Cj4gPiBpbnQgY3VyX2gpCj4gPiDCoMKgwqDCoMKgwqDCoMKgaWd0X3B1dF9jYWlyb19jdHgoY3Ip
Owo+ID4gwqB9Cj4gPiDCoAo+ID4gLXN0YXRpYyBib29sIGhhc19ub25zcXVhcmVfY3Vyc29ycyhk
YXRhX3QgKmRhdGEpCj4gPiArc3RhdGljIHZvaWQgcmVxdWlyZV9jdXJzb3Jfc2l6ZShkYXRhX3Qg
KmRhdGEsIGludCB3LCBpbnQgaCkKPiA+IMKgewo+ID4gLcKgwqDCoMKgwqDCoMKgdWludDMyX3Qg
ZGV2aWQ7Cj4gPiArwqDCoMKgwqDCoMKgwqBpZ3RfZmJfdCBwcmltYXJ5X2ZiOwo+ID4gK8KgwqDC
oMKgwqDCoMKgZHJtTW9kZU1vZGVJbmZvICptb2RlOwo+ID4gK8KgwqDCoMKgwqDCoMKgaWd0X2Rp
c3BsYXlfdCAqZGlzcGxheSA9ICZkYXRhLT5kaXNwbGF5Owo+ID4gK8KgwqDCoMKgwqDCoMKgaWd0
X291dHB1dF90ICpvdXRwdXQgPSBkYXRhLT5vdXRwdXQ7Cj4gPiArwqDCoMKgwqDCoMKgwqBpZ3Rf
cGxhbmVfdCAqcHJpbWFyeSwgKmN1cnNvcjsKPiA+ICvCoMKgwqDCoMKgwqDCoGludCByZXQ7Cj4g
PiDCoAo+ID4gLcKgwqDCoMKgwqDCoMKgaWYgKCFpc19pOTE1X2RldmljZShkYXRhLT5kcm1fZmQp
KQo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBmYWxzZTsKPiA+ICvC
oMKgwqDCoMKgwqDCoGlndF9vdXRwdXRfc2V0X3BpcGUob3V0cHV0LCBkYXRhLT5waXBlKTsKPiA+
IMKgCj4gPiAtwqDCoMKgwqDCoMKgwqBkZXZpZCA9IGludGVsX2dldF9kcm1fZGV2aWQoZGF0YS0+
ZHJtX2ZkKTsKPiA+ICvCoMKgwqDCoMKgwqDCoG1vZGUgPSBpZ3Rfb3V0cHV0X2dldF9tb2RlKG91
dHB1dCk7Cj4gPiArwqDCoMKgwqDCoMKgwqBwcmltYXJ5ID0gaWd0X291dHB1dF9nZXRfcGxhbmVf
dHlwZShvdXRwdXQsIERSTV9QTEFORV9UWVBFX1BSSU1BUlkpOwo+ID4gK8KgwqDCoMKgwqDCoMKg
Y3Vyc29yID0gaWd0X291dHB1dF9nZXRfcGxhbmVfdHlwZShvdXRwdXQsIERSTV9QTEFORV9UWVBF
X0NVUlNPUik7Cj4gPiDCoAo+ID4gLcKgwqDCoMKgwqDCoMKgLyoKPiA+IC3CoMKgwqDCoMKgwqDC
oCAqIFRlc3Qgbm9uLXNxdWFyZSBjdXJzb3JzIGEgYml0IG9uIHRoZSBwbGF0Zm9ybXMKPiA+IC3C
oMKgwqDCoMKgwqDCoCAqIHRoYXQgc3VwcG9ydCBzdWNoIHRoaW5ncy4KPiA+IC3CoMKgwqDCoMKg
wqDCoCAqLwo+ID4gLcKgwqDCoMKgwqDCoMKgaWYgKGRldmlkID09IFBDSV9DSElQXzg0NV9HIHx8
IGRldmlkID09IFBDSV9DSElQX0k4NjVfRykKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqByZXR1cm4gdHJ1ZTsKPiA+ICvCoMKgwqDCoMKgwqDCoC8qIENyZWF0ZSB0ZW1wb3Jhcnkg
cHJpbWFyeSBmYiBmb3IgdGVzdGluZyAqLwo+ID4gK8KgwqDCoMKgwqDCoMKgaWd0X2Fzc2VydChp
Z3RfY3JlYXRlX2ZiKGRhdGEtPmRybV9mZCwgbW9kZS0+aGRpc3BsYXksIG1vZGUtCj4gPiA+dmRp
c3BsYXksIERSTV9GT1JNQVRfWFJHQjg4ODgsCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTE9DQUxfRFJNX0ZPUk1BVF9N
T0RfTk9ORSwgJnByaW1hcnlfZmIpKTsKPiA+IMKgCj4gPiAtwqDCoMKgwqDCoMKgwqBpZiAoSVNf
VkFMTEVZVklFVyhkZXZpZCkgfHwgSVNfQ0hFUlJZVklFVyhkZXZpZCkpCj4gPiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGZhbHNlOwo+ID4gK8KgwqDCoMKgwqDCoMKgaWd0
X3BsYW5lX3NldF9mYihwcmltYXJ5LCAmcHJpbWFyeV9mYik7Cj4gPiArwqDCoMKgwqDCoMKgwqBp
Z3RfcGxhbmVfc2V0X2ZiKGN1cnNvciwgJmRhdGEtPmZiKTsKPiA+ICvCoMKgwqDCoMKgwqDCoGln
dF9wbGFuZV9zZXRfc2l6ZShjdXJzb3IsIHcsIGgpOwo+ID4gK8KgwqDCoMKgwqDCoMKgaWd0X2Zi
X3NldF9zaXplKCZkYXRhLT5mYiwgY3Vyc29yLCB3LCBoKTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKg
wqDCoC8qIFRlc3QgaWYgdGhlIGtlcm5lbCBzdXBwb3J0cyB0aGUgZ2l2ZW4gY3Vyc29yIHNpemUg
b3Igbm90ICovCj4gPiArwqDCoMKgwqDCoMKgwqByZXQgPSBpZ3RfZGlzcGxheV90cnlfY29tbWl0
X2F0b21pYyhkaXNwbGF5LAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBEUk1fTU9E
RV9BVE9NSUNfVEVTVF9PTkxZIHwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRFJN
X01PREVfQVRPTUlDX0FMTE9XX01PREVTRVQsCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIE5VTEwpOwo+IAo+IFdvdWxkIGJlIGJldHRlciB0byBub3QgZGVwZW5kIG9uIGF0b21pYy4g
V2UgaGF2ZSBwbGF0Zm9ybXMKPiB0aGF0IGRvbid0IGV4cG9zZSBpdCB5ZXQuCgpEbyB5b3UgaGF2
ZSBhbnkgb3RoZXIgaWRlYXMgaG93IHdlIGNvdWxkIHByb2JlIGZvciB0aGlzIHRoZW4/IGl0IHNl
ZW1zIGxpa2UgdGhlCm9ubHkgYWx0ZXJuYXRpdmUgd291bGQgYmUgdG8gYWRkIGludGVsLXNwZWNp
ZmljIGNoZWNrcyB0byBmaXggdGhhdCwgb3IgYWRkIHNvbWUKaW9jdGwgZm9yIHF1ZXJ5aW5nIHRo
ZSBtaW5pbXVtIGN1cnNvciBzaXplICh3aGljaCBzb3VuZHMgcHJlZmVyYWJsZSBpbW8pLiB3b3Vs
ZAp0aGUgbGF0dGVyIHdvcmsgZm9yIHlvdSwgb3IgZG8geW91IGhhdmUgYW5vdGhlciBpZGVhPwo+
IAo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgaWd0X3BsYW5lX3NldF9mYihwcmltYXJ5LCBOVUxM
KTsKPiA+ICvCoMKgwqDCoMKgwqDCoGlndF9wbGFuZV9zZXRfZmIoY3Vyc29yLCBOVUxMKTsKPiA+
ICsKPiA+ICvCoMKgwqDCoMKgwqDCoGlndF9yZW1vdmVfZmIoZGF0YS0+ZHJtX2ZkLCAmcHJpbWFy
eV9mYik7Cj4gPiArwqDCoMKgwqDCoMKgwqBpZ3Rfb3V0cHV0X3NldF9waXBlKG91dHB1dCwgUElQ
RV9OT05FKTsKPiA+IMKgCj4gPiAtwqDCoMKgwqDCoMKgwqByZXR1cm4gaW50ZWxfZ2VuKGRldmlk
KSA+PSA3Owo+ID4gK8KgwqDCoMKgwqDCoMKgaWd0X3NraXBfb25fZihyZXQsICJDdXJzb3Igc2l6
ZSAlZHglZCBub3Qgc3VwcG9ydGVkIGJ5IGRyaXZlclxuIiwgdywKPiA+IGgpOwo+ID4gwqB9Cj4g
PiDCoAo+ID4gwqBzdGF0aWMgdm9pZCB0ZXN0X2N1cnNvcl9zaXplKGRhdGFfdCAqZGF0YSkKPiA+
IEBAIC02OTcsMjcgKzcxNCwzMyBAQCBzdGF0aWMgdm9pZCBydW5fdGVzdHNfb25fcGlwZShkYXRh
X3QgKmRhdGEsIGVudW0gcGlwZQo+ID4gcGlwZSkKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNyZWF0ZV9jdXJzb3JfZmIoZGF0YSwgdywgaCk7Cj4g
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0KPiA+IMKgCj4gPiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgLyogVXNpbmcgY3JlYXRlZCBjdXJzb3IgRkJzIHRvIHRlc3Qg
Y3Vyc29yIHN1cHBvcnQgKi8KPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZ3Rf
ZGVzY3JpYmUoIkNoZWNrIGlmIGEgZ2l2ZW4tc2l6ZSBjdXJzb3IgaXMgd2VsbC0KPiA+IHBvc2l0
aW9uZWQgaW5zaWRlIHRoZSBzY3JlZW4uIik7Cj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgaWd0X3N1YnRlc3RfZigicGlwZS0lcy1jdXJzb3ItJWR4JWQtb25zY3JlZW4iLAo+ID4g
a21zdGVzdF9waXBlX25hbWUocGlwZSksIHcsIGgpCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJ1bl90ZXN0KGRhdGEsIHRlc3RfY3JjX29uc2NyZWVu
LCB3LCBoKTsKPiA+IC0KPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZ3RfZGVz
Y3JpYmUoIkNoZWNrIGlmIGEgZ2l2ZW4tc2l6ZSBjdXJzb3IgaXMgd2VsbC0KPiA+IHBvc2l0aW9u
ZWQgb3V0c2lkZSB0aGUgc2NyZWVuLiIpOwo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGlndF9zdWJ0ZXN0X2YoInBpcGUtJXMtY3Vyc29yLSVkeCVkLW9mZnNjcmVlbiIsCj4gPiBr
bXN0ZXN0X3BpcGVfbmFtZShwaXBlKSwgdywgaCkKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcnVuX3Rlc3QoZGF0YSwgdGVzdF9jcmNfb2Zmc2NyZWVu
LCB3LCBoKTsKPiA+IC0KPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZ3RfZGVz
Y3JpYmUoIkNoZWNrIHRoZSBzbW9vdGggYW5kIHBpeGVsLWJ5LXBpeGVsIGdpdmVuLXNpemUKPiA+
IGN1cnNvciBtb3ZlbWVudHMgb24iCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJob3Jpem9udGFsLCB2ZXJ0aWNhbCBhbmQgZGlhZ29u
YWwuIik7Cj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWd0X3N1YnRlc3RfZigi
cGlwZS0lcy1jdXJzb3ItJWR4JWQtc2xpZGluZyIsCj4gPiBrbXN0ZXN0X3BpcGVfbmFtZShwaXBl
KSwgdywgaCkKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgcnVuX3Rlc3QoZGF0YSwgdGVzdF9jcmNfc2xpZGluZywgdywgaCk7Cj4gPiAtCj4gPiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWd0X2Rlc2NyaWJlKCJDaGVjayByYW5kb20gcGxh
Y2VtZW50IG9mIGEgY3Vyc29yIHdpdGggZ2l2ZW4KPiA+IHNpemUuIik7Cj4gPiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgaWd0X3N1YnRlc3RfZigicGlwZS0lcy1jdXJzb3ItJWR4JWQt
cmFuZG9tIiwKPiA+IGttc3Rlc3RfcGlwZV9uYW1lKHBpcGUpLCB3LCBoKQo+ID4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBydW5fdGVzdChkYXRhLCB0ZXN0
X2NyY19yYW5kb20sIHcsIGgpOwo+ID4gLQo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGlndF9kZXNjcmliZSgiQ2hlY2sgdGhlIHJhcGlkIHVwZGF0ZSBvZiBnaXZlbi1zaXplIGN1
cnNvcgo+ID4gbW92ZW1lbnRzLiIpOwo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGlndF9zdWJ0ZXN0X2YoInBpcGUtJXMtY3Vyc29yLSVkeCVkLXJhcGlkLW1vdmVtZW50IiwKPiA+
IGttc3Rlc3RfcGlwZV9uYW1lKHBpcGUpLCB3LCBoKSB7Cj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJ1bl90ZXN0KGRhdGEsIHRlc3RfcmFwaWRfbW92
ZW1lbnQsIHcsIGgpOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlndF9zdWJ0
ZXN0X2dyb3VwIHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgaWd0X2ZpeHR1cmUKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJlcXVpcmVfY3Vyc29yX3NpemUoZGF0YSwgdywg
aCk7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoC8qIFVzaW5nIGNyZWF0ZWQgY3Vyc29yIEZCcyB0byB0ZXN0IGN1cnNvciBzdXBwb3J0Cj4g
PiAqLwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBp
Z3RfZGVzY3JpYmUoIkNoZWNrIGlmIGEgZ2l2ZW4tc2l6ZSBjdXJzb3IgaXMgd2VsbC0KPiA+IHBv
c2l0aW9uZWQgaW5zaWRlIHRoZSAiCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAic2NyZWVuLiIpOwo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZ3Rfc3VidGVz
dF9mKCJwaXBlLSVzLWN1cnNvci0lZHglZC1vbnNjcmVlbiIsCj4gPiBrbXN0ZXN0X3BpcGVfbmFt
ZShwaXBlKSwgdywgaCkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJ1bl90ZXN0KGRhdGEsIHRlc3RfY3JjX29uc2NyZWVu
LCB3LCBoKTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgaWd0X2Rlc2NyaWJlKCJDaGVjayBpZiBhIGdpdmVuLXNpemUgY3Vyc29yIGlzIHdl
bGwtCj4gPiBwb3NpdGlvbmVkIG91dHNpZGUgdGhlICIKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJzY3Jl
ZW4uIik7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGlndF9zdWJ0ZXN0X2YoInBpcGUtJXMtY3Vyc29yLSVkeCVkLW9mZnNjcmVlbiIsCj4gPiBrbXN0
ZXN0X3BpcGVfbmFtZShwaXBlKSwgdywgaCkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJ1bl90ZXN0KGRhdGEsIHRlc3Rf
Y3JjX29mZnNjcmVlbiwgdywgaCk7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlndF9kZXNjcmliZSgiQ2hlY2sgdGhlIHNtb290aCBhbmQg
cGl4ZWwtYnktcGl4ZWwKPiA+IGdpdmVuLXNpemUgY3Vyc29yICIKPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICJtb3ZlbWVudHMgb24gaG9yaXpvbnRhbCwgdmVydGljYWwgYW5kCj4gPiBkaWFnb25hbC4iKTsK
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWd0X3N1
YnRlc3RfZigicGlwZS0lcy1jdXJzb3ItJWR4JWQtc2xpZGluZyIsCj4gPiBrbXN0ZXN0X3BpcGVf
bmFtZShwaXBlKSwgdywgaCkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJ1bl90ZXN0KGRhdGEsIHRlc3RfY3JjX3NsaWRp
bmcsIHcsIGgpOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBpZ3RfZGVzY3JpYmUoIkNoZWNrIHJhbmRvbSBwbGFjZW1lbnQgb2YgYSBjdXJz
b3IKPiA+IHdpdGggZ2l2ZW4gc2l6ZS4iKTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgaWd0X3N1YnRlc3RfZigicGlwZS0lcy1jdXJzb3ItJWR4JWQt
cmFuZG9tIiwKPiA+IGttc3Rlc3RfcGlwZV9uYW1lKHBpcGUpLCB3LCBoKQo+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcnVu
X3Rlc3QoZGF0YSwgdGVzdF9jcmNfcmFuZG9tLCB3LCBoKTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWd0X2Rlc2NyaWJlKCJDaGVjayB0
aGUgcmFwaWQgdXBkYXRlIG9mIGdpdmVuLXNpemUKPiA+IGN1cnNvciBtb3ZlbWVudHMuIik7Cj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlndF9zdWJ0
ZXN0X2YoInBpcGUtJXMtY3Vyc29yLSVkeCVkLXJhcGlkLW1vdmVtZW50IiwKPiA+IGttc3Rlc3Rf
cGlwZV9uYW1lKHBpcGUpLCB3LCBoKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcnVuX3Rlc3QoZGF0YSwgdGVzdF9yYXBp
ZF9tb3ZlbWVudCwgdywgaCk7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0K
PiA+IMKgCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlndF9maXh0dXJlCj4g
PiBAQCAtNzMwLDI3ICs3NTMsMjUgQEAgc3RhdGljIHZvaWQgcnVuX3Rlc3RzX29uX3BpcGUoZGF0
YV90ICpkYXRhLCBlbnVtIHBpcGUKPiA+IHBpcGUpCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAqLwo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBoIC89IDM7
Cj4gPiDCoAo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlndF9maXh0dXJlIHsK
PiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKGhh
c19ub25zcXVhcmVfY3Vyc29ycyhkYXRhKSkKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNyZWF0ZV9jdXJzb3JfZmIoZGF0
YSwgdywgaCk7Cj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfQo+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlndF9maXh0dXJlCj4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNyZWF0ZV9jdXJzb3JfZmIoZGF0YSwgdywg
aCk7Cj4gPiDCoAo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qIFVzaW5nIGNy
ZWF0ZWQgY3Vyc29yIEZCcyB0byB0ZXN0IGN1cnNvciBzdXBwb3J0ICovCj4gPiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgaWd0X3N1YnRlc3RfZigicGlwZS0lcy1jdXJzb3ItJWR4JWQt
b25zY3JlZW4iLAo+ID4ga21zdGVzdF9waXBlX25hbWUocGlwZSksIHcsIGgpIHsKPiA+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWd0X3JlcXVpcmUoaGFz
X25vbnNxdWFyZV9jdXJzb3JzKGRhdGEpKTsKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgcnVuX3Rlc3QoZGF0YSwgdGVzdF9jcmNfb25zY3JlZW4sIHcs
IGgpOwo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0KPiA+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBpZ3Rfc3VidGVzdF9mKCJwaXBlLSVzLWN1cnNvci0lZHglZC1v
ZmZzY3JlZW4iLAo+ID4ga21zdGVzdF9waXBlX25hbWUocGlwZSksIHcsIGgpIHsKPiA+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWd0X3JlcXVpcmUoaGFz
X25vbnNxdWFyZV9jdXJzb3JzKGRhdGEpKTsKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgcnVuX3Rlc3QoZGF0YSwgdGVzdF9jcmNfb2Zmc2NyZWVuLCB3
LCBoKTsKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9Cj4gPiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgaWd0X3N1YnRlc3RfZigicGlwZS0lcy1jdXJzb3ItJWR4JWQt
c2xpZGluZyIsCj4gPiBrbXN0ZXN0X3BpcGVfbmFtZShwaXBlKSwgdywgaCkgewo+ID4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZ3RfcmVxdWlyZShoYXNf
bm9uc3F1YXJlX2N1cnNvcnMoZGF0YSkpOwo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBydW5fdGVzdChkYXRhLCB0ZXN0X2NyY19zbGlkaW5nLCB3LCBo
KTsKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9Cj4gPiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgaWd0X3N1YnRlc3RfZigicGlwZS0lcy1jdXJzb3ItJWR4JWQtcmFu
ZG9tIiwKPiA+IGttc3Rlc3RfcGlwZV9uYW1lKHBpcGUpLCB3LCBoKSB7Cj4gPiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlndF9yZXF1aXJlKGhhc19ub25z
cXVhcmVfY3Vyc29ycyhkYXRhKSk7Cj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHJ1bl90ZXN0KGRhdGEsIHRlc3RfY3JjX3JhbmRvbSwgdywgaCk7Cj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWd0X3N1YnRlc3RfZ3JvdXAgewo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZ3RfZml4dHVy
ZQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgcmVxdWlyZV9jdXJzb3Jfc2l6ZShkYXRhLCB3LCBoKTsKPiA+ICsKPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLyogVXNpbmcgY3Jl
YXRlZCBjdXJzb3IgRkJzIHRvIHRlc3QgY3Vyc29yIHN1cHBvcnQKPiA+ICovCj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlndF9zdWJ0ZXN0X2YoInBp
cGUtJXMtY3Vyc29yLSVkeCVkLW9uc2NyZWVuIiwKPiA+IGttc3Rlc3RfcGlwZV9uYW1lKHBpcGUp
LCB3LCBoKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgcnVuX3Rlc3QoZGF0YSwgdGVzdF9jcmNfb25zY3JlZW4sIHcsIGgp
Owo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBpZ3Rfc3VidGVzdF9mKCJwaXBlLSVzLWN1cnNvci0lZHglZC1vZmZzY3JlZW4iLAo+ID4ga21z
dGVzdF9waXBlX25hbWUocGlwZSksIHcsIGgpCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBydW5fdGVzdChkYXRhLCB0ZXN0
X2NyY19vZmZzY3JlZW4sIHcsIGgpOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZ3Rfc3VidGVzdF9mKCJwaXBlLSVzLWN1cnNvci0lZHgl
ZC1zbGlkaW5nIiwKPiA+IGttc3Rlc3RfcGlwZV9uYW1lKHBpcGUpLCB3LCBoKQo+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
cnVuX3Rlc3QoZGF0YSwgdGVzdF9jcmNfc2xpZGluZywgdywgaCk7Cj4gPiArCj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlndF9zdWJ0ZXN0X2YoInBp
cGUtJXMtY3Vyc29yLSVkeCVkLXJhbmRvbSIsCj4gPiBrbXN0ZXN0X3BpcGVfbmFtZShwaXBlKSwg
dywgaCkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHJ1bl90ZXN0KGRhdGEsIHRlc3RfY3JjX3JhbmRvbSwgdywgaCk7Cj4g
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0KPiA+IMKgCj4gPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlndF9maXh0dXJlCj4gPiAtLSAKPiA+IDIuMjkuMgo+ID4g
Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4g
aWd0LWRldiBtYWlsaW5nIGxpc3QKPiA+IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4g
PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
PiAKCi0tIApTaW5jZXJlbHksCiAgIEx5dWRlIFBhdWwgKHNoZS9oZXIpCiAgIFNvZnR3YXJlIEVu
Z2luZWVyIGF0IFJlZCBIYXQKICAgCk5vdGU6IEkgZGVhbCB3aXRoIGEgbG90IG9mIGVtYWlscyBh
bmQgaGF2ZSBhIGxvdCBvZiBidWdzIG9uIG15IHBsYXRlLiBJZiB5b3UndmUKYXNrZWQgbWUgYSBx
dWVzdGlvbiwgYXJlIHdhaXRpbmcgZm9yIGEgcmV2aWV3L21lcmdlIG9uIGEgcGF0Y2gsIGV0Yy4g
YW5kIEkKaGF2ZW4ndCByZXNwb25kZWQgaW4gYSB3aGlsZSwgcGxlYXNlIGZlZWwgZnJlZSB0byBz
ZW5kIG1lIGFub3RoZXIgZW1haWwgdG8gY2hlY2sKb24gbXkgc3RhdHVzLiBJIGRvbid0IGJpdGUh
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1
IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
