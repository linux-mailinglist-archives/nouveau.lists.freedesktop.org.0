Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2FED26A8
	for <lists+nouveau@lfdr.de>; Thu, 10 Oct 2019 11:50:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA1C96E2D3;
	Thu, 10 Oct 2019 09:50:30 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B1A86E34E
 for <nouveau@lists.freedesktop.org>; Thu, 10 Oct 2019 09:50:30 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id 89so4294099oth.13
 for <nouveau@lists.freedesktop.org>; Thu, 10 Oct 2019 02:50:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=s7u8RrLVc4Ffe5y8mkFLdJ8MxE7mGLxRxEXRcX5s+bs=;
 b=NS/TRRd+i/hLX/IErh38KEiUI2gc0cd2nMR9UBgIyK78/kjWqwGzd2l1d598ziFIs6
 +CYJhsagpOdNT57R6mvLdomjOaxcaEkcMSH/7wLvmXwW7x+B+obSCrUmIkXodjhUDtfd
 AvRK0s+NLg53ZMal5c3yXd2fC8NNndUF+DeRNoeIFXtHgUSuViidbw7CJ7W8um5Pxxcl
 4Aav707nSuOUlux1kn3Jh9K4X3LByaCbjP6nh6jm5IyL9DZganLq4xeKZ+O+jsTVfyIR
 n45SAvNUANImz4bihBbwNh9eb8ejL1spPNplU7pxQsOnZG1uQpbP+UT1nyROotGornN9
 2KlA==
X-Gm-Message-State: APjAAAUxcTGYaCvbJHfuvqj/bmouSznnu+/eL9aL35/hKy6Ww5YmxHk1
 HhL3w3p8YFuamUlIAIoodzuln7nHQJUWNJdbfBKShQ==
X-Google-Smtp-Source: APXvYqwHb4Oxux2DNwykbX4nB02KU0ydyo2OLPI9irOxSv/EbfifbA1yRDW20+XcIJVJTURRDOwBpyWXqbaeMy+MLTc=
X-Received: by 2002:a05:6830:f:: with SMTP id
 c15mr7247106otp.204.1570701029401; 
 Thu, 10 Oct 2019 02:50:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190930131254.31071-1-christian.koenig@amd.com>
 <20191009153934.GJ16989@phenom.ffwll.local>
 <0c20edc1-f336-c194-f4a5-bc0ce9d67fd8@gmail.com>
In-Reply-To: <0c20edc1-f336-c194-f4a5-bc0ce9d67fd8@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 10 Oct 2019 11:50:17 +0200
Message-ID: <CAKMK7uFKJAnd0ztRheP0fXD1GKQuRYPc7dpXeHtO0qjCPciT8g@mail.gmail.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=s7u8RrLVc4Ffe5y8mkFLdJ8MxE7mGLxRxEXRcX5s+bs=;
 b=YCMEmq4h4fA/3brI9+dvajWrzgKx8GX/2JbgiXBotO0AIAbvXQrKmJ4lSteyjZbId/
 99leQoAlCLtm3OzWTxFnFTqpP37cyppPo3KVmagg1Ce0M1D7bCmvDPxAW7Iru2A46arg
 fhgMK00uwTGCoORYvZlpiW+amdqxOPUrHVnpk=
Subject: Re: [Nouveau] [PATCH 1/2] drm/nouveau: move io_reserve_lru handling
 into the driver
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
Cc: Dave Airlie <airlied@linux.ie>, Nouveau Dev <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgOTo1NCBBTSBDaHJpc3RpYW4gS8O2bmlnCjxja29lbmln
LmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBBbSAwOS4xMC4xOSB1bSAxNzoz
OSBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4gPiBPbiBNb24sIFNlcCAzMCwgMjAxOSBhdCAwMzox
Mjo1M1BNICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+ID4gW1NOSVBdCj4gPj4gK3N0
YXRpYyB2bV9mYXVsdF90IG5vdXZlYXVfdHRtX2ZhdWx0KHN0cnVjdCB2bV9mYXVsdCAqdm1mKQo+
ID4+ICt7Cj4gPj4gKyAgICBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSA9IHZtZi0+dm1hOwo+
ID4+ICsgICAgc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibyA9IHZtYS0+dm1fcHJpdmF0ZV9k
YXRhOwo+ID4+ICsgICAgcGdwcm90X3QgcHJvdDsKPiA+PiArICAgIHZtX2ZhdWx0X3QgcmV0Owo+
ID4+ICsKPiA+PiArICAgIHJldCA9IHR0bV9ib192bV9yZXNlcnZlKGJvLCB2bWYpOwo+ID4+ICsg
ICAgaWYgKHJldCkKPiA+PiArICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+PiArCj4gPj4gKyAg
ICBub3V2ZWF1X2JvX2RlbF9pb19yZXNlcnZlX2xydShibyk7Cj4gPiBJc24ndCB0aGlzIG9wZW5p
bmcgdXAgYSBjYW4gb2Ygd29ybXMgKGluIHRoZW9yeSkgd2hlcmUgYSBsb3Qgb2YgY29uY3VycmVu
dAo+ID4gZmF1bHRzIHdpbGwgYWxsIGZhaWwgYmVjYXVzZSB0aGV5J3JlIGFsbCByZW1vdmVkIHRo
ZW1zZWx2ZXMgZnJvbSB0aGUgbHJ1LAo+ID4gc28gY2FuJ3Qgc2VlIGFueW9uZSBlbHNlIHRvIHRo
cm93IG91dD8KPiA+Cj4gPiBTYW1lIHByb2JsZW0gcmVhbGx5IHRoYXQgdHRtIGhhZCAod2VsbCBz
dGlsbCBoYXMgSSB0aGluayBmb3IgIWFtZGdwdSkgd2l0aAo+ID4gaXRzIG90aGVyIGxydSAuLi4K
PiA+Cj4gPiBPciBhbSBJIGdldHRpbmcgdG90YWxseSBsb3N0IGFnYWluIGhlcmU/Cj4KPiBObywg
eW91ciBhcmUgcHJldHR5IG11Y2ggY29ycmVjdC4gQnV0IHdlIGFyZSBub3Qgb3BlbmluZyB1cCB0
aGF0IGNhbiBvZgo+IHdvcm1zLCBpdCBoYXMgYmVlbiBoZXJlIGZvciBsaWtlIGFsd2F5cy4KCkFo
LCBJIGRpZG4ndCBjaGVjayB0aGUgdHRtLWJhc2VkIHZlcnNpb24gY2xvc2VseSBlbm91Z2ggdG8g
Y29udmluY2UKbXlzZWxmIGl0IGhhcyB0aGUgc2FtZSBwcm9ibGVtLgoKPiBZb3UganVzdCBuZWVk
IHRvIGltYWdpbmUgdGhhdCB5b3UgaGF2ZSB0d28gcHJvY2Vzc2VzIGtpY2tpbmcgb3V0IHRoZQo+
IHBhZ2UgdGFibGVzIG9mIGVhY2ggb3RoZXIgYmVmb3JlIHNvbWVib2R5IGhhZCBhIGNoYW5jZSB0
byBtYWtlIHByb2dyZXNzLgo+IFRoaXMgd2lsbCBqdXN0IGxvb3AgZm9yZXZlciA6KQo+Cj4gVGhl
IGNvcnJlY3Qgc29sdXRpb24gaXMgdG8gbm90IHVzZSBhIEJPIGJhc2VkIGFwcHJvYWNoIGF0IGFs
bCwgYnV0Cj4gcmF0aGVyIGEgd2luZG93IGJhc2VkIGFwcHJvYWNoIHdoZXJlIHlvdSBoYXZlIGFu
IExSVSBvZiB0aGUgd2luZG93IHlvdQo+IGdhdmUgb3V0IGxhc3QgdG8gYWNjZXNzIHNvbWV0aGlu
Zy4gVGhpcyB3YXkgeW91IGhhdmUgYSBtdWNoIGxhcmdlcgo+IG51bWJlciBvZiB3aW5kb3dzIHlv
dSBjYW4gdXNlICg0ayBpZiB5b3UgdXNlIDY0a0Igd2luZG93IHNpemUgb24gYSAyNTZNQgo+IEJB
UikuCj4KPiBUaGlzIHdheSB5b3UgY2FuIHNhZmVseSBhc3N1bWUgdGhhdCB0aGUgbnVtYmVyIG9m
IHdpbmRvd3MgeW91IGhhdmUKPiBhdmFpbGFibGUgaXMgYWx3YXlzIGxhcmdlciB0aGFuIHRoZSBu
dW1iZXIgb2YgZmF1bHRzIHlvdSBjYW4gcHJvY2VzcyBhdAo+IHRoZSBzYW1lIHRpbWUuIEJ1dCB0
aGF0IHdvdWxkIHJlcXVpcmUgcXVpdGUgYSBidW5jaCBvZiBjaGFuZ2VzIGZvciBUVE0KPiBhcyB3
ZWxsIGFzIG5vdXZlYXUuCgpZZWFoIHdlIGRvIHRoYXQgb24gaTkxNSBzaW5jZSBhIHdoaWxlLCBi
dWZmZXJzIGJlY2FtZSB3YXkgdG9vIGJpZy4KU29tZXdoYXQgdHJpY2t5IG9uIG9sZGVyIGh3IHdo
ZXJlIHdlIGFsc28gZGV0aWxlLCB0aGVyZSB0aGUgd2luZG93IHdlCnBpY2sgbmVlZHMgdG8gYmUg
YXQgbGVhc3QgYSBmdWxsIHRpbGUgcm93LgoKPiBCVFc6IFRoaXMgaXMgb25lIG9mIHRoZSByZWFz
b25zIChhZGRpdGlvbmFsIHRvIHRoYXQgaXQgaXMgaG9ycmlibGUgc2xvdykKPiB3aHkgd2UgbmV2
ZXIgdXNlZCB0aGUgcmVtYXBwaW5nIGZlYXR1cmUgb24gQU1EIGhhcmR3YXJlIGZvciBMaW51eC4K
Ck5vdCBmZWVsaW5nIGxpa2UgYSBmdWxsIHItYiwgYW5kIHlvdSBkZWZpbml0ZWx5IHdhbnQgc29t
ZW9uZSB0byB0ZXN0CnRoaXMgb24gbm91dmVhdSwgYnV0IGF0IGxlYXQKCkFja2VkLWJ5OiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgoKZm9yIHRoZSBzZXJpZXMuCi1EYW5p
ZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9u
Cis0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QK
Tm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
