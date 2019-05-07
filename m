Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CCC16469
	for <lists+nouveau@lfdr.de>; Tue,  7 May 2019 15:18:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85EC06E7D1;
	Tue,  7 May 2019 13:18:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 753C26E7D1;
 Tue,  7 May 2019 13:18:02 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 31DE92002B;
 Tue,  7 May 2019 15:17:58 +0200 (CEST)
Date: Tue, 7 May 2019 15:17:56 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: jagdsh.linux@gmail.com, robdclark@gmail.com, sean@poorly.run,
 airlied@linux.ie, bskeggs@redhat.com, hierry.reding@gmail.com,
 jcrouse@codeaurora.org, jsanka@codeaurora.org,
 skolluku@codeaurora.org, paul.burton@mips.com, jrdr.linux@gmail.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org
Message-ID: <20190507131756.GA17647@ravnborg.org>
References: <1556906293-128921-1-git-send-email-jagdsh.linux@gmail.com>
 <20190506144334.GH17751@phenom.ffwll.local>
 <20190507100532.GP17751@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190507100532.GP17751@phenom.ffwll.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8
 a=4sjd1iRJTynRc3plxrAA:9 a=CjuIK1q_8ugA:10
Subject: Re: [Nouveau] [PATCH] gpu/drm: Remove duplicate headers
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

T24gVHVlLCBNYXkgMDcsIDIwMTkgYXQgMTI6MDU6MzJQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBNb24sIE1heSAwNiwgMjAxOSBhdCAwNDo0MzozNFBNICswMjAwLCBEYW5pZWwg
VmV0dGVyIHdyb3RlOgo+ID4gT24gRnJpLCBNYXkgMDMsIDIwMTkgYXQgMTE6Mjg6MTNQTSArMDUz
MCwgamFnZHNoLmxpbnV4QGdtYWlsLmNvbSB3cm90ZToKPiA+ID4gRnJvbTogSmFnYWRlZXNoIFBh
Z2FkYWxhIDxqYWdkc2gubGludXhAZ21haWwuY29tPgo+ID4gPiAKPiA+ID4gUmVtb3ZlIGR1cGxp
Y2F0ZSBoZWFkZXJzIHdoaWNoIGFyZSBpbmNsdWRlZCB0d2ljZS4KPiA+ID4gCj4gPiA+IFNpZ25l
ZC1vZmYtYnk6IEphZ2FkZWVzaCBQYWdhZGFsYSA8amFnZHNoLmxpbnV4QGdtYWlsLmNvbT4KPiA+
IAo+ID4gSSBjb2xsZWN0ZWQgc29tZSBhY2tzIGZvciB0aGUgbXNtIGFuZCBub3V2ZWF1IHBhcnRz
IGFuZCBwdXNoZWQgdGhpcy4gRm9yCj4gPiBuZXh0IHRpbWUgYXJvdW5kIHdvdWxkIGJlIGdyZWF0
IGlmIHlvdSBzcGxpdCB0aGVzZSB1cCBhbG9uZyBkcml2ZXIvbW9kdWxlCj4gPiBib3VuZGFyaWVz
LCBzbyB0aGF0IGVhY2ggbWFpbnRhaW5lciBjYW4gcGljayB0aGlzIHVwIGRpcmVjdGx5Lgo+ID4g
Cj4gPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2guCj4gPiAtRGFuaWVsCj4gPiAKPiA+ID4gLS0tCj4g
PiA+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfaHdfbG0uYyAgICAgICAgICAg
ICB8IDEgLQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvYnVzL252
MDQuYyAgICAgICAgfCAyIC0tCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcmFz
cGJlcnJ5cGktdG91Y2hzY3JlZW4uYyB8IDEgLQo+IAo+IENvcnJlY3Rpb24sIHRoaXMgZGlkbid0
IGNvbXBpbGUsIHNvIEkgZHJvcHBlZCB0aGUgY2hhbmdlcyB0byBwYW5lbC1ycGkuCj4gQW5vdGhl
ciByZWFzb24gdG8gc3BsaXQgcGF0Y2hlcyBtb3JlIGZvciBuZXh0IHRpbWUgYXJvdW5kLiBBbHNv
LCBuZWVkcwo+IG1vcmUgY29tcGlsZSB0ZXN0aW5nICh5b3UgbmVlZCBjcm9zcyBjb21waWxlcnMg
Zm9yIGF0IGxlYXN0IGFybSB0byB0ZXN0Cj4gdGhpcyBzdHVmZikuCkkgd2lsbCB0cnkgdG8gcmVz
dXJyZWN0IG15IHBhdGNoIHNlcmllcyBmb3IgZHJtL3BhbmVsLyB0aGF0CmFkZHJlc3NlczoKLSBy
ZW1vdmFsIG9mIGRybVAuaAotIHJlbW92YWwgb2YgZHVwbGljYXRlZCBpbmNsdWRlIGZpbGVzCi0g
c29ydCBhbGwgaW5jbHVkZSBmaWxlcwoKSW4gb3RoZXIgd29yZHMgLSBwYW5lbC1yYXNwYmVycnlw
aS10b3VjaHNjcmVlbi5jIHdpbGwgYmUgZGVhbHQgd2l0aC4KSSBleHBlY3QgdG8gbG9vayBhdCBp
dCBpbiB0d28gd2Vla3MgdGltZSAob24gdmFjYXRpb24gc3RhcnRpbmcgZnJpZGF5KS4KCglTYW0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
