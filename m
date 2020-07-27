Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7161E22EBF0
	for <lists+nouveau@lfdr.de>; Mon, 27 Jul 2020 14:20:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B74D089885;
	Mon, 27 Jul 2020 12:20:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF6289885
 for <nouveau@lists.freedesktop.org>; Mon, 27 Jul 2020 12:20:01 +0000 (UTC)
Date: Mon, 27 Jul 2020 12:10:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1595851855;
 bh=7T2V8dmulkwVbuZa5e86xmoCDPsOSrWQJXoS7o4h7L4=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=uPWU3+wN2K75S4x5sn5r6XqCSIG3bxUG7SBCCc80e8x8stE1Chn3r9Vlf2w6R1vaU
 +jntHDSV/D9N5o9g4jL3oRJ6kODEvBWqxGyOPezSJZtr3K0knjJemYDWptHV+B+hKe
 5xM7fZuhpkSpKtfsGpTB58iRkUm/kWI1BRJ++I2U=
To: Ilia Mirkin <imirkin@alum.mit.edu>
From: Jasmin <jasmin.pm@protonmail.com>
Message-ID: <kLkT-zEG64cmSAUlvGzfN4XjERRX_PZqLoFPl0EDQ19SnYH32-CUapgYB-X4Wp3srfM60UkRgia1b5h0CCHkqXkFWmheERcPYLnn4yE0Tm4=@protonmail.com>
In-Reply-To: <D-hdgPgWmiyZfEPUXCL_D132ZWmQVAopKtR2up1uwjNtaxsXUkRzrVNBTNLNM_tMLRaa_dv7s25AhRW5xRfSxhqJC39Ngw04rIbGoHnFRAI=@protonmail.com>
References: <QoDOhTStpq2yEF5SaIbKoDh3i_nTSTVGy5rrV-8827WSM5NlVnXJ8pQ9HTvQnOL-XfnXry0duLHZgOyq2qD2Xg7RWqpswmIZ_O_wicapPrs=@protonmail.com>
 <CAKb7UviVqPZKuZ-Mj94FSDV=3+FDjEzk0RfENacMmU-3Nd2GqQ@mail.gmail.com>
 <D-hdgPgWmiyZfEPUXCL_D132ZWmQVAopKtR2up1uwjNtaxsXUkRzrVNBTNLNM_tMLRaa_dv7s25AhRW5xRfSxhqJC39Ngw04rIbGoHnFRAI=@protonmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
Subject: Re: [Nouveau] DP MST with GK107 and lenovo ultra dock
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
Reply-To: Jasmin <jasmin.pm@protonmail.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

SGksCgptZWFud2hpbGUgSSBmaWd1cmVkIG91dCB3aHkgZGlzcGxheXBvcnQgTVNUIGRpZCBub3Qg
d29yayB3aXRoIG5vdXZlYXUgb24gR0sxMDcgd2l0aCBMZW5vdm8gVzU0MCBhbmQgTGVub3ZvIFVs
dHJhIERvY2suCgpOb3V2ZWF1IGRvZXMgbm90IHRyeSB0byBlc3RhYmxpc2ggTVNULCBpZiB0aGUg
Y29ubmVjdG9yIHR5cGUgaXMgcmVjb2duaXplZCBhcyBlRFAgKGVtYmVkZGVkIGRpc3BsYXlwb3J0
KSwgd2hpY2ggZG9lcyBub3Qgc3VwcG9ydCBNU1QuCgpUaGUgY29ubmVjdG9yIHR5cGUgaXMgcmVj
b2duaXplZCBieSByZWFkaW5nIERDQiBjb25uZWN0b3IgdGFibGUgZnJvbSB0aGUgVkJJT1MuCmh0
dHA6Ly9kb3dubG9hZC5udmlkaWEuY29tL29wZW4tZ3B1LWRvYy9EQ0IvCkluIHRoaXMgY2FzZSwg
dGhlIERDQiBjb25uZWN0b3IgdGFibGUgaGVhZGVyIHNlZW1lZCB0byBjb250YWluICJ2ZXJzaW9u
IDAiICh6ZXJvIGluIHRoZSB2ZXJzaW9uIGZpZWxkKSwgc28gaXQgd2FzIG5vdCB1c2VkIGFuZCBu
b3V2ZWF1IHRyaWVkIHRvIGRldGVybWluZSB0aGUgY29ubmVjdG9ycyBhdXRvbWF0aWNhbGx5LCB3
aGljaCB3cm9uZ2x5IHJlc3VsdGVkIGluIGVEUCBpbnN0ZWFkIG9mIERQLgoKQnV0IHRoZSBWQklP
UyBpdHNlbGYgZGlkIF9ub3RfIGNvbnRhaW4gdGhpcyAidmVyc2lvbiAwIi4gSW5zdGVhZCwgdGhp
cyB3YXMgYSByZXN1bHQgcHJvZHVjZWQgYnkgbm91dmVhdSBpdHNlbGYgd2hlbiBwYXJzaW5nIHRo
ZSBEQ0IgYmVmb3JlaGFuZDoKbm91dmVhdV9iaW9zLmM6ZGNiX2Zha2VfY29ubmVjdG9ycyhzdHJ1
Y3QgbnZiaW9zICpiaW9zKQoKPiAgICAgICAgLyogaGV1cmlzdGljOiBpZiB3ZSBldmVyIGdldCBh
IG5vbi16ZXJvIGNvbm5lY3RvciBmaWVsZCwgYXNzdW1lCj4gICAgICAgICAqIHRoYXQgYWxsIHRo
ZSBpbmRpY2VzIGFyZSB2YWxpZCBhbmQgd2UgZG9uJ3QgbmVlZCBmYWtlIHRoZW0uCj4gICAgICAg
ICAqCgpBdCBsZWFzdCBpZiB0aGUgbGFwdG9wJ3MgZGVkaWNhdGVkIG52aWRpYSBHUFUgaXMgY29u
ZmlndXJlZCAoaW4gVUVGSSkgdG8gc3VwcGx5IHRoZSBkb2NraW5nIHN0YXRpb24gd2l0aCBkaXNw
bGF5cG9ydC1zaWduYWxzIChhZHZhbmNlZCBtb2RlKSwgdGhlIGNvbm5lY3RvciBmaWVsZCBmb3Ig
Ym90aCBEQ0ItZW50cmllcyBpcyAiemVybyIg4oCTIGFuIGl0IGlzIHZhbGlkL2NvcnJlY3QsIGJl
Y2F1c2UgdGhlcmUgaXMgbm8gb3RoZXIgY29ubmVjdG9yIHRoYW4gdGhpcyAiemVybyIgb25lLgoK
U28gdGhlIGhldXJpc3RpY2FsIGRldGVybWluYXRpb24gb2YgdmFsaWQgY29ubmVjdG9yIGRhdGEg
ZmFpbHMgaW4gdGhpcyBjYXNlLCBhbmQgaXQgImRpc2FibGVzIiB0aGUgZGNiLWNvbm5lY3RvciB0
YWJsZSBpbmFkZXF1YXRlbHkgYnkgd3JpdGluZyB2ZXJzaW9uIDAgaW50byB0aGUgZGIgY29ubmVj
dG9yIHRhYmxlIGhlYWRlci4KClNvIEkgbWFuYWdlZCB0byBmaXggdGhpcyBieSBpbnNlcnRpbmcg
dGhlIGZvbGxvd2luZyBhdCB0aGUgYmVnaW5uaW5nIG9mIGRjYl9mYWtlX2Nvbm5lY3RvcnM6Cgor
ICAgICAgICAvLyBoYXMgMiBEQ0IgZW50cmllcyB3aXRoIGNvbm5lY3RvciBpbmRleCB6ZXJvIChj
b3JyZWN0KQorICAgICAgICBpZihudl9tYXRjaF9kZXZpY2UoYmlvcy0+ZGV2LCAweDBmZjYsIDB4
MTdhYSwgMHgyMjFhKSkKKyAgICAgICAgICAgICAgICByZXR1cm47CgpJTUhPIGl0IG1ha2VzIHNl
bnNlIHRvIGludHJvZHVjZSBhIG1vZHVsZSBwYXJhbWV0ZXI6ICJhbHdheXNUcnVzdERDQkNvbm50
YWIiLCB3aGljaCBjb3VsZCBiZSBzZXQgdG8gInRydWUiIGZvciBzdWNoIGNhc2VzLgoKQmVzdApK
YXNtaW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91
dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
