Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C8532B809
	for <lists+nouveau@lfdr.de>; Wed,  3 Mar 2021 14:33:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C1C86E05A;
	Wed,  3 Mar 2021 13:33:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A45D6E05A
 for <nouveau@lists.freedesktop.org>; Wed,  3 Mar 2021 13:33:34 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id g9so21364053ilc.3
 for <nouveau@lists.freedesktop.org>; Wed, 03 Mar 2021 05:33:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QsqoIZdp1UtAYyWbFGtflvnxY+dvnxg40PaGh7EDz40=;
 b=aFL5A3WqZJijhgQq14mbPCFhm1foICLl5p3Kqm8pPtcSCnwyh+38i5JrPo8M6wqxJ5
 quw3W604hYnpm2GLsLcqbEQt11JlMKqsDjmtQEqqr2uiwnjV9U0QOd+VoCIav3j2/+ix
 2AeTlwnQ+35f+4J7jKRDmPrD8exaHMjVnzzOXBMMowe+13zDOC0X9OAP7uexolqPeEfs
 y7H00qYtrnktzzrNM8iMyiFijK4nhlhkby/iyxvo4WalM55Jr5T2hPHiw1nHHjGhxFoO
 PV3I378bPCt7Vm+8CGSDgay1TjvT8fqibMl1YvIcfekTqSWuZ6uY0atRLhxvqsS0GNGn
 Ie3g==
X-Gm-Message-State: AOAM531YncrUJ7fjxRtVtdqqpFsk4gbj+Ubi/agQYVkQtNNpDkOl4hUM
 9LXXcHBNmqWpCEb/JQd4eeuceMWXv+zDlk5DxaE=
X-Google-Smtp-Source: ABdhPJz2nYj53Itrb09M1Er7cYuyVK1wb1SFve2Bj0upxu8nk5TOVnKB9AEeTm4RkG4wyiHmAa14KJHHhDYVn3hhSyo=
X-Received: by 2002:a92:2c08:: with SMTP id t8mr21686575ile.72.1614778413511; 
 Wed, 03 Mar 2021 05:33:33 -0800 (PST)
MIME-Version: 1.0
References: <YDYXiTm7MDXgYT7H@pflmari>
 <CAKb7UvgQXXThAfqJo+FEfUbgLtGzb2kvg9aSFXZn_XWivsv48Q@mail.gmail.com>
 <YDaAQts9LIb5h3xd@pflmari>
 <CAKb7Uvi8GUe+F3oMOwtAxOAi5ffF=b=9XYv+fZf742frroXfSA@mail.gmail.com>
 <YDaEiDkTiqhy/r+i@pflmari>
 <CAKb7UviFdgqqSrFvZJzfenaKa_0P6hJ4SaDrwA39Lz8jVigDGw@mail.gmail.com>
 <YDaGtzRDUIbErYDY@pflmari>
 <CAKb7UvjBQeb84sitYUTLOd6EJo_+_9hXjmT=8r5V1onxtUMh7g@mail.gmail.com>
 <91687a59-dae6-199e-ca4a-35b49b6959ea@gmail.com>
 <CAKb7Uvg-R-rW_=+YZusocwwedDzHc0Nffwki5vOEd4tP6zRy3g@mail.gmail.com>
 <YD+D/zhUwC4zaO8v@pflmari>
 <CAKb7Uvj1cGMx3R1dM2MYsFoP9g65c0Eg_pBROsfjicOv7jcBvg@mail.gmail.com>
 <4cfd5800-1f3a-4740-244c-599601517cda@gmail.com>
In-Reply-To: <4cfd5800-1f3a-4740-244c-599601517cda@gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Wed, 3 Mar 2021 08:33:22 -0500
Message-ID: <CAKb7UviXJp30K5VBdNS_THru8Er-p4OHKad4Oxuxm8Pdck_yRQ@mail.gmail.com>
To: uwe.sauter.de@gmail.com
Subject: Re: [Nouveau] [PATCH 2/3] drm/nouveau/kms/nv50-: Report max cursor
 size to userspace
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
Cc: Alex Riesen <alexander.riesen@cetitec.com>,
 nouveau <nouveau@lists.freedesktop.org>, Simon Ser <contact@emersion.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXIgMywgMjAyMSBhdCA4OjI1IEFNIFV3ZSBTYXV0ZXIgPHV3ZS5zYXV0ZXIuZGVA
Z21haWwuY29tPiB3cm90ZToKPgo+IEFtIDAzLjAzLjIxIHVtIDE0OjEyIHNjaHJpZWIgSWxpYSBN
aXJraW46Cj4gPiBPbiBXZWQsIE1hciAzLCAyMDIxIGF0IDc6NDEgQU0gQWxleCBSaWVzZW4gPGFs
ZXhhbmRlci5yaWVzZW5AY2V0aXRlYy5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gSWxpYSBNaXJraW4s
IFNhdCwgRmViIDI3LCAyMDIxIDIyOjI2OjU3ICswMTAwOgo+ID4+PiBDYW4geW91IHRyeSBBbGV4
J3MgcGF0Y2ggdG8gbW9kZXRlc3QgYW5kIGNvbmZpcm0gdGhhdCB5b3Ugc2VlIGlzc3Vlcwo+ID4+
PiB3aXRoIG1vZGV0ZXN0PyBJZiBzbywgY2FuIHlvdSAoYW5kIG1heWJlIEFsZXggYXMgd2VsbCkg
dHJ5IGFuIG9sZGVyCj4gPj4+IGtlcm5lbCAoSSdtIG9uIDUuNikgYW5kIHNlZSBpZiBtb2RldGVz
dCBiZWhhdmVzIHdlbGwgdGhlcmUuIFtUaGUgcGF0Y2gKPiA+Pj4gaW4gcXVlc3Rpb24gd2FzIHRv
IGV4cG9zZSAyNTZ4MjU2IGFzIHRoZSAncHJlZmVycmVkJyBzaXplLCBidXQgc3VwcG9ydAo+ID4+
PiBmb3IgdGhlIGxhcmdlciBjdXJzb3JzIGhhcyBiZWVuIGFyb3VuZCBmb3IgYSB3aGlsZS5dIEFs
ZXggLSBpZiB5b3UKPiA+Pj4gaGF2ZSB0aW1lLCBzYW1lIHF1ZXN0aW9uIHRvIHlvdS4KPiA+Pgo+
ID4+IFNvcnJ5IHRoYXQgaXQgdG9vayBzbyBsb25nLiBJIHJldGVzdGV0IHdpdGggdGhlIHNhbWUg
a2VybmVsIGFzIFV3ZSBkaWQKPiA+PiAoNS40LjEwMSkgYW5kIG15IHJlc3VsdHMgYXJlIHRoZSBz
YW1lOiBtb2RldGVzdCB3aXRoIDY0IGFuZCAxMjggY3Vyc29ycyBsb29rcwo+ID4+IGdvb2QsIDI1
NiBicm9rZW4uIERpZG4ndCB0ZXN0IHdpdGggWCB0aGlzIHRpbWUgKHRoaXMgYmVpbmcgbXkgbWFp
biBvZmZpY2UKPiA+PiBtYWNoaW5lKSwgYnV0IGNhbiBkbyBsYXRlciBpZiByZXF1aXJlZC4KPiA+
Cj4gPiBUaGFua3MgZm9yIGNvbmZpcm1pbmchIE5vIG5lZWQgdG8gdGVzdCBYIC0gdGhhdCB3aWxs
IHdvcmsgZmluZSwgc2luY2UKPiA+IHdlIHdlcmUgcmVwb3J0aW5nIHRoZSBzbWFsbGVyIGN1cnNv
cnMgb24gdGhhdCBrZXJuZWwuCj4gPgo+ID4gU28gSSB0aGluayB3ZSBoYXZlIGRlZmluaXRpdmUg
ZXZpZGVuY2UgdGhhdCBhdCBsZWFzdCBhbGwgS2VwbGVyCj4gPiBkb2Vzbid0IGRvIDI1NngyNTYg
KGFuZCBpdCdzIG5vdCBqdXN0IHNvbWUgYnVnIGluIHRoZSBkaXNwbGF5IG1hY3JvCj4gPiByZXdv
cmsgdGhhdCBnb3QgaW50cm9kdWNlZCkuIEFuZCB1bmxlc3MgSSdtIGJsaW5kIGFuZCBkb24ndCBz
ZWUgdGhlCj4gPiBjb3JydXB0aW9uLCBQYXNjYWwgc2VlbXMgZmluZS4gUXVlc3Rpb24gcmVtYWlu
cyBmb3IgTWF4d2VsbDEvMiBHUFVzLgo+ID4gVW5sZXNzIHNvbWVvbmUgaGFzIGltbWVkaWF0ZSBw
bGFucyB0byB0ZXN0IG9uIHRob3NlLCBJJ2QgcmVjb21tZW5kCj4gPiBidW1waW5nIHRoZSBtaW5p
bXVtIGZvciAyNTZ4MjU2IGJlaW5nIHJlcG9ydGVkIHRvIFBhc2NhbCwgYW5kIGRvaW5nCj4gPiAx
Mjh4MTI4IGZvciBLZXBsZXIgLyBNYXh3ZWxsLgo+Cj4gVGhlIG9ubHkgb2xkZXIgbW9kZWwgSSBo
YXZlIGFjY2VzcyB0byB3b3VsZCBiZSBhIDY2MDBHVCAoTlY0MykuIERvbid0IGtub3cgaWYgdGhp
cyB3b3VsZCBoYXZlIGFueQo+IHNpZ25pZmljYW5jZeKApgoKTm9wZSwgd2Ugd2FudCBuZXdlciA6
KSBNYXh3ZWxsIGNhbWUgYWZ0ZXIgS2VwbGVyLiBHVFggNzUwIGZvciBNYXh3ZWxsCjEsIGFuZCBH
VFggOXh4IGZvciBNYXh3ZWxsIDIuIChHTTEweCBhbmQgR00yMHgpLgoKQ2hlZXJzLAoKICAtaWxp
YQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1
IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
