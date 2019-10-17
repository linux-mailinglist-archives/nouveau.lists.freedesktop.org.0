Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51796DB0D5
	for <lists+nouveau@lfdr.de>; Thu, 17 Oct 2019 17:13:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B496E09E;
	Thu, 17 Oct 2019 15:13:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 538 seconds by postgrey-1.36 at gabe;
 Thu, 17 Oct 2019 15:13:33 UTC
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net
 [176.9.242.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1E0E6E09E
 for <nouveau@lists.freedesktop.org>; Thu, 17 Oct 2019 15:13:33 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.hostsharing.net",
 Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
 by bmailout3.hostsharing.net (Postfix) with ESMTPS id DF5AB100F00C1;
 Thu, 17 Oct 2019 17:04:33 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 88270458E52; Thu, 17 Oct 2019 17:04:33 +0200 (CEST)
Message-Id: <3086bc75135c1e3567c5bc4f3cc4ff5cbf7a56c2.1571324194.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Thu, 17 Oct 2019 17:04:11 +0200
MIME-Version: 1.0
To: Takashi Iwai <tiwai@suse.com>
Subject: [Nouveau] [PATCH] ALSA: hda - Force runtime PM on Nvidia HDMI codecs
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
Cc: Rivera Valdez <riveravaldez@ysinembargo.com>, alsa-devel@alsa-project.org,
 Przemyslaw Kopa <prymoo@gmail.com>, Daniel Drake <dan@reactivated.net>,
 Jaroslav Kysela <perex@perex.cz>, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

UHJ6ZW15c8WCYXcgS29wYSByZXBvcnRzIHRoYXQgc2luY2UgY29tbWl0IGI1MTZlYTU4NmQ3MSAo
IlBDSTogRW5hYmxlCk5WSURJQSBIREEgY29udHJvbGxlcnMiKSwgdGhlIGRpc2NyZXRlIEdQVSBO
dmlkaWEgR2VGb3JjZSBHVCA1NDBNIG9uIGhpcwoyMDExIFNhbXN1bmcgbGFwdG9wIHJlZnVzZXMg
dG8gcnVudGltZSBzdXNwZW5kLCByZXN1bHRpbmcgaW4gYSBwb3dlcgpyZWdyZXNzaW9uIGFuZCBl
eGNlc3NpdmUgaGVhdC4KClJpdmVyYSBWYWxkZXogd2l0bmVzc2VzIHRoZSBzYW1lIGlzc3VlIHdp
dGggYSBHZUZvcmNlIEdUIDUyNU0gKEdGMTA4TSkKb2YgdGhlIHNhbWUgZXJhLCBhcyBkb2VzIGFu
b3RoZXIgQXJjaCBMaW51eCB1c2VyIG5hbWVkICJSMEFSIiB3aXRoIGEKbW9yZSByZWNlbnQgR2VG
b3JjZSBHVFggMTA1MCBUaSAoR1AxMDdNKS4KClRoZSBjb21taXQgZXhwb3NlcyB0aGUgZGlzY3Jl
dGUgR1BVJ3MgSERBIGNvbnRyb2xsZXIgYW5kIGFsbCBmb3VyIGNvZGVjcwpvbiB0aGUgY29udHJv
bGxlciBkbyBub3Qgc2V0IHRoZSBDTEtTVE9QIGFuZCBFUFNTIGJpdHMgaW4gdGhlIFN1cHBvcnRl
ZApQb3dlciBTdGF0ZXMgUmVzcG9uc2UuICBUaGV5IGFsc28gZG8gbm90IHNldCB0aGUgUFMtQ2xr
U3RvcE9rIGJpdCBpbiB0aGUKR2V0IFBvd2VyIFN0YXRlIFJlc3BvbnNlLiAgaGRhX2NvZGVjX3J1
bnRpbWVfc3VzcGVuZCgpIHRoZXJlZm9yZSBkb2VzCm5vdCBjYWxsIHNuZF9oZGFjX2NvZGVjX2xp
bmtfZG93bigpLCB3aGljaCBwcmV2ZW50cyBlYWNoIGNvZGVjIGFuZCB0aGUKUENJIGRldmljZSBm
cm9tIHJ1bnRpbWUgc3VzcGVuZGluZy4KClRoZSBzYW1lIGlzc3VlIGlzIHByZXNlbnQgb24gc29t
ZSBBTUQgZGlzY3JldGUgR1BVcyBhbmQgd2UgYWRkcmVzc2VkIGl0CmJ5IGZvcmNpbmcgcnVudGlt
ZSBQTSBkZXNwaXRlIHRoZSBiaXRzIG5vdCBiZWluZyBzZXQsIHNlZSBjb21taXQKNTdjYjU0ZTUz
YmRkICgiQUxTQTogaGRhIC0gRm9yY2UgdG8gbGluayBkb3duIGF0IHJ1bnRpbWUgc3VzcGVuZCBv
bgpBVEkvQU1EIEhETUkiKS4KCkRvIHRoZSBzYW1lIGZvciBOdmlkaWEgSERNSSBjb2RlY3MuCgpG
aXhlczogYjUxNmVhNTg2ZDcxICgiUENJOiBFbmFibGUgTlZJRElBIEhEQSBjb250cm9sbGVycyIp
Ckxpbms6IGh0dHBzOi8vYmJzLmFyY2hsaW51eC5vcmcvdmlld3RvcGljLnBocD9waWQ9MTg2NTUx
MgpMaW5rOiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD03NTk4
NSNjODEKUmVwb3J0ZWQtYnk6IFByemVteXPFgmF3IEtvcGEgPHByeW1vb0BnbWFpbC5jb20+ClJl
cG9ydGVkLWJ5OiBSaXZlcmEgVmFsZGV6IDxyaXZlcmF2YWxkZXpAeXNpbmVtYmFyZ28uY29tPgpT
aWduZWQtb2ZmLWJ5OiBMdWthcyBXdW5uZXIgPGx1a2FzQHd1bm5lci5kZT4KQ2M6IERhbmllbCBE
cmFrZSA8ZGFuQHJlYWN0aXZhdGVkLm5ldD4KQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcgIyB2
NS4zKwotLS0KIHNvdW5kL3BjaS9oZGEvcGF0Y2hfaGRtaS5jIHwgMiArKwogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfaGRt
aS5jIGIvc291bmQvcGNpL2hkYS9wYXRjaF9oZG1pLmMKaW5kZXggYmNhNWRlNy4uNzk1Y2JkYSAx
MDA2NDQKLS0tIGEvc291bmQvcGNpL2hkYS9wYXRjaF9oZG1pLmMKKysrIGIvc291bmQvcGNpL2hk
YS9wYXRjaF9oZG1pLmMKQEAgLTM0NzQsNiArMzQ3NCw4IEBAIHN0YXRpYyBpbnQgcGF0Y2hfbnZo
ZG1pKHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjKQogCQludmhkbWlfY2htYXBfY2VhX2FsbG9jX3Zh
bGlkYXRlX2dldF90eXBlOwogCXNwZWMtPmNobWFwLm9wcy5jaG1hcF92YWxpZGF0ZSA9IG52aGRt
aV9jaG1hcF92YWxpZGF0ZTsKIAorCWNvZGVjLT5saW5rX2Rvd25fYXRfc3VzcGVuZCA9IDE7CisK
IAlnZW5lcmljX2Fjb21wX2luaXQoY29kZWMsICZudmhkbWlfYXVkaW9fb3BzLCBudmhkbWlfcG9y
dDJwaW4pOwogCiAJcmV0dXJuIDA7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vbm91dmVhdQ==
