Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E70BC457
	for <lists+nouveau@lfdr.de>; Tue, 24 Sep 2019 10:58:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F1026E9A2;
	Tue, 24 Sep 2019 08:58:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 479 seconds by postgrey-1.36 at gabe;
 Tue, 24 Sep 2019 08:58:23 UTC
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC3A6E9A2
 for <nouveau@lists.freedesktop.org>; Tue, 24 Sep 2019 08:58:23 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id D57553A7; Tue, 24 Sep 2019 10:50:22 +0200 (CEST)
Date: Tue, 24 Sep 2019 10:50:22 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Thierry Reding <thierry.reding@gmail.com>
Message-ID: <20190924085022.GB18171@8bytes.org>
References: <20190916150412.10025-1-thierry.reding@gmail.com>
 <20190916150412.10025-5-thierry.reding@gmail.com>
 <7d917275-0a2d-6de3-e837-6dfa4d9a29c8@codethink.co.uk>
 <20190916154946.GD7488@ulmo> <20190916155443.GF7488@ulmo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190916155443.GF7488@ulmo>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Nouveau] [PATCH 04/11] drm/nouveau: gp10b: Add custom L2 cache
 implementation
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
Cc: linux-tegra@vger.kernel.org, nouveau@lists.freedesktop.org,
 Ben Dooks <ben.dooks@codethink.co.uk>, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

SGkgVGhpZXJyeSwKCk9uIE1vbiwgU2VwIDE2LCAyMDE5IGF0IDA1OjU0OjQzUE0gKzAyMDAsIFRo
aWVycnkgUmVkaW5nIHdyb3RlOgo+ID4gSm9lcmcsIHRvIHN1bW1hcml6ZTogdGhlIHByb3Bvc2Fs
IGhlcmUgaXMgdG8gbW92ZSB0aGUgZGVjbGFyYXRpb24gb2YgdGhlCj4gPiBpb21tdV9md3NwZWMg
b3V0c2lkZSBvZiB0aGUgSU9NTVVfQVBJIGd1YXJkIGFuZCBwcm92aWRlIGEgZHVtbXkKPiA+IGlt
cGxlbWVudGF0aW9uIG9mIGRldl9pb21tdV9md3NwZWNfZ2V0KCkgdG8gYWxsb3cgdGhpcyBjb2Rl
IHRvIGJlIGJ1aWx0Cj4gPiB3aXRob3V0IHRoZSAjaWZkZWYgZ3VhcmRzLiBXZSBoYWQgZGlzY3Vz
c2VkIHNvbWV0aGluZyBzaW1pbGFyIGFib3V0IDUKPiA+IHllYXJzIGJhY2sgYW5kIGF0IHRoZSB0
aW1lIHlvdSBoYWQgYmVlbiBvcHBvc2VkOgo+ID4gCj4gPiAJaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtaW9tbXUvMTQwNjg5NzExMy0yMDA5OS0xLWdpdC1zZW5kLWVtYWlsLXRoaWVycnku
cmVkaW5nQGdtYWlsLmNvbS8KPiA+IAo+ID4gVGhlIGNhc2UgaGVyZSBpcyBzbGlnaHRseSBkaWZm
ZXJlbnQgYW5kIGEgbG90IG9mIHRpbWUgaGFzIHBhc3NlZCBzaW5jZSwKPiA+IHNvIGp1c3Qgd2Fu
dGVkIHRvIGFzayBpZiB5b3VyIG9waW5pb24gaGVyZSBpcyB0aGUgc2FtZSwgb3Igd2hldGhlciB5
b3UKPiA+IHdvdWxkIGFjY2VwdCBhIHBhdGNoIHRvIG1ha2UgdGhpcyBidWlsZGFibGUgd2l0aG91
dCByZXNvcnRpbmcgdG8KPiA+ICNpZmRlZidlcnkuCgpUaGlzIGlzIGFib3V0IERSTSwgc28gaWYg
aXQgaXMgZmluZSB0byBidWlsZCBkcm0vbm91dmVhdSB3aXRob3V0CklPTU1VLUFQSSBJIGFtIGFs
c28gZmluZSB3aXRoIGR1bW15cyBmb3IgZGV2X2lvbW11X2Z3c3BlY19nZXQoKSBhbmQgYQpkdW1t
eSAnc3RydWN0IGlvbW11X2Z3c3BlYycuCgpSZWdhcmRzLAoKCUpvZXJnCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5v
dXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
