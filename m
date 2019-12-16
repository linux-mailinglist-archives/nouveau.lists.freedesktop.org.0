Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E8A121116
	for <lists+nouveau@lfdr.de>; Mon, 16 Dec 2019 18:08:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B43E6E83B;
	Mon, 16 Dec 2019 17:08:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
 [209.85.222.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E3906E83B
 for <nouveau@lists.freedesktop.org>; Mon, 16 Dec 2019 17:08:43 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id f7so2338891uaa.8
 for <nouveau@lists.freedesktop.org>; Mon, 16 Dec 2019 09:08:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=q3ix8TUCwC07rs4yw5oMjnZyhOsQqTLjtAAKCDNR2QE=;
 b=KR7j9XV3dt+fNDP3mdK2ARbxL+s3/PQa4C7AneMopDB4C5K5ax7beO2L+GjZlRoAPU
 N3udG7YZ0U5Gd5bmiw0bbn51I2+UkMTOWWDHUsFCfVJbFWAZvVosodXeyv+dH+sGHnrt
 F05VDMFxETtX+fvpKxW8PnP31x6kCDKlipDGo6fCrvaHIvYjwDZtNrGdu2WhVpeW+uUT
 rVshejihPFtXbleyqg6/jVEJDP+kyj6ejVqFLRFtT6D/v272pZFrsFMj1SBZjgTfmiaM
 w7CgcrjkL/vhnkhV06cUAN/JsPAgguxTXMK9uvjRNKHPv5w0aD2tfzqsetHjPR65zv+C
 5SWA==
X-Gm-Message-State: APjAAAXHcLOrvE3M/91G+BkOAQT/82vHqTBtBAQKL0ZUGQdCRiQdxpqb
 E2NP3Y08iZyV/vjOeORxRWoZzm5FJq5lt1q9+DQ=
X-Google-Smtp-Source: APXvYqyfo+itlUX/AR4K3CY0ddhl46sgtH9EHUWj0EGgG5BnCC4hH870unjgXw+gfWV9MywYS0y2ALk3XFxP8C6WUVk=
X-Received: by 2002:ab0:63c7:: with SMTP id i7mr25133uap.109.1576516122007;
 Mon, 16 Dec 2019 09:08:42 -0800 (PST)
MIME-Version: 1.0
References: <c34a6fe1-80dd-a4db-c605-0a13c69e803f@wp.pl>
In-Reply-To: <c34a6fe1-80dd-a4db-c605-0a13c69e803f@wp.pl>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Mon, 16 Dec 2019 12:08:30 -0500
Message-ID: <CAKb7UviSYORoeDm1sbDFEzkGd68+DV=StCpzsiaGbA=1VQX3gw@mail.gmail.com>
To: =?UTF-8?Q?Marcin_Zaj=C4=85czkowski?= <mszpak@wp.pl>
Subject: Re: [Nouveau] Tracking down severe regression in 5.3-rc4/5.4 for
 TU116 - assistance needed
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
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

SGkgTWFyY2luLAoKWW91IHNob3VsZCBkbyBhIGdpdCBiaXNlY3QgcmF0aGVyIHRoYW4gZ3Vlc3Np
bmcgYWJvdXQgY29tbWl0cy4gSQpzdXNwZWN0IHRoYXQgc2VhcmNoaW5nIGZvciAia2VybmVsIGdp
dCBiaXNlY3QgZmVkb3JhIiBzaG91bGQgcHJvdmUKaW5zdHJ1Y3RpdmUgaWYgeW91J3JlIG5vdCBz
dXJlIGhvdyB0byBkbyB0aGlzLgoKQ2hlZXJzLAoKICAtaWxpYQoKT24gTW9uLCBEZWMgMTYsIDIw
MTkgYXQgMTE6NDIgQU0gTWFyY2luIFphasSFY3prb3dza2kgPG1zenBha0B3cC5wbD4gd3JvdGU6
Cj4KPiBIaSwKPgo+IEkndmUgZW5jb3VudGVyZWQgYSBzZXZlcmUgcmVncmVzc2lvbiBpbiBUVTEx
NiAocHJvYmFibHkgYWxzbyBUVTExNykKPiBpbnRyb2R1Y2VkIGluIDUuMy1yYzQgKHZhbGlkIGFs
c28gZm9yIHJlY2VudCA1LjQuMikgWzFdLiBUaGUgc3lzdGVtCj4gdXN1YWxseSBoYW5ncyBvbiB0
aGUgc3Vic2VxdWVudCBncmFwaGljIG1vZGUgcmVsYXRlZCBvcGVyYXRpb24gKGNhbGxpbmcKPiB4
cmFuZHIgYWZ0ZXIgbG9naW4gaXMgZW5vdWdoKSB3aXRoIHRoZSBmb2xsb3dpbmcgZXJyb3I6Cj4K
PiA+IGtlcm5lbDogbm91dmVhdSAwMDAwOjAxOjAwLjA6IGZpZm86IFNDSEVEX0VSUk9SIDA4IFtd
Cj4gLi4uCj4gPiBrZXJuZWw6IG5vdXZlYXUgMDAwMDowMTowMC4wOiBEUk06IGZhaWxlZCB0byBp
ZGxlIGNoYW5uZWwgMCBbRFJNXQo+ID4ga2VybmVsOiBub3V2ZWF1IDAwMDA6MDE6MDAuMDogaTJj
OiBhdXggMDAwNzogYmVnaW4gaWRsZSB0aW1lb3V0IGZmZmZmZmZmCj4gPiBrZXJuZWw6IG5vdXZl
YXUgMDAwMDowMTowMC4wOiB0bXI6IHN0YWxsZWQgYXQgZmZmZmZmZmZmZmZmZmZmZgo+ID4ga2Vy
bmVsOiAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0KPiA+IGtlcm5lbDogbm91
dmVhdSAwMDAwOjAxOjAwLjA6IHRpbWVvdXQKPiA+IGtlcm5lbDogV0FSTklORzogQ1BVOiAxMCBQ
SUQ6IDM4NCBhdCBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9iYXIvZzg0LmM6
MzUgZzg0X2Jhcl9mbHVzaCsweGNmLz4gMHhlMCBbbm91dmVhdV0KPgo+IChkZXRhaWxlZCBsb2cg
aW4gYSBjb3JyZXNwb25kaW5nIGlzc3VlIC0gWzFdKQo+Cj4gV2l0aCBlYXJsaWVyIGtlcm5lbHMg
dGhlcmUgd2FzIG5vIGhhcmR3YXJlIGFjY2VsZXJhdGlvbiBmb3IgTlZpZGlhIEdUWAo+IDE2NjAg
VGksIGJ1dCBhdCBsZWFzdCBJIGNvdWxkIHVzZSBub3V2ZWF1IHRvIGRpc2FibGUgaXQgKHRvIHNh
dmUKPiBiYXR0ZXJ5LCB0cmVlcyBhbmQgbG93ZXIgdGVtcGVyYXR1cmUpIG9yIGV2ZW4gaGF2ZSBh
biBleHRlcm5hbCBvdXRwdXQKPiAod2l0aCBXYXlsYW5kKS4gTm93LCB0aGUgc3lzdGVtIGlzIHVu
dXNhYmxlIHdpdGggbm91dmVhdSA6KC4KPgo+IEkgc3BlbnQgc29tZSB0aW1lIHRyeWluZyB0byBu
YXJyb3cgdGhlIHNjb3BlIHVzaW5nIG9uIHRoZSBleGlzdGluZwo+IGtlcm5lbCBidWlsZHMgZm9y
IEZlZG9yYS4gSSB3YXMgYWJsZSB0byBkZXRlcm1pbmUgdGhhdCB0aGUgcHJvYmxlbSB3YXMKPiBp
bnRyb2R1Y2VkIGJldHdlZW4gNS4zLjAtMC5yYzMuZ2l0MS4xIChjb21taXQgMzM5MjBmMWVjNWJm
IC0gd29ya3MgZmluZSkKPiBhbmQgNS4zLjAtMC5yYzQuZ2l0MC4xICh0YWcgdjUuMy1yYzQgLSBm
YWlscyB3aXRoIGVycm9ycykuCj4KPiBJdCdzIGp1c3QgYSBmZXcgZGF5cyAoNy0xMSBBdWcpIGFu
ZCAib25seSIgYXJvdW5kIDI1MCBjb21taXRzLiBJIHdlbnQKPiB0aHJvdWdoIHRoZW0sIGJ1dCAo
YmFzZWQgb24gdGhlIGNvbW1pdHMgbmFtZSkgSSBoYXZlbid0IHNlZW4gYW55IG5vdXZlYXUKPiBy
ZWxhdGVkIGNoYW5nZXMgYW5kIGluIGdlbmVyYWwgbm8gdmVyeSBzdXNwZWN0ZWQgZHJtIHJlbGF0
ZWQgY2hhbmdlcy4KPgo+ID4gZ2l0IGxvZyAzMzkyMGYxZWM1YmYuLnY1LjMtcmM0IC0tc3RhdAo+
Cj4KPiBNYXliZSBzb21lIG9mIG1vcmUgbm91dmVhdS9kcm0tZXhwZXJpZW5jZWQgZGV2ZWxvcGVy
cyBjb3VsZCB0YWtlIGEgbG9vawo+IGF0IHRoYXQgdG8gZGV0ZXJtaW5lIHdoaWNoIGNvbW1pdCBj
b3VsZCBicmVhayBpdCAodG8gbWFrZSBpdCBlYXNpZXIgdG8KPiBmaW5kIG91dCB3aGF0IHNob3Vs
ZCBiZSBmaXhlZCB0byBwcmV2ZW50IHRoYXQgcmVncmVzc2lvbik/Cj4KPgo+IFsxXSAtCj4gaHR0
cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3hvcmcvZHJpdmVyL3hmODYtdmlkZW8tbm91dmVh
dS9pc3N1ZXMvNTE2Cj4KPiBUaGFua3MgaW4gYWR2YW5jZQo+IE1hcmNpbgo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTm91dmVhdSBtYWlsaW5nIGxp
c3QKPiBOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL25vdXZlYXUK
