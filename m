Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AD2197AF6
	for <lists+nouveau@lfdr.de>; Mon, 30 Mar 2020 13:38:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A30789D4D;
	Mon, 30 Mar 2020 11:38:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AAEB89D4D
 for <nouveau@lists.freedesktop.org>; Mon, 30 Mar 2020 11:38:30 +0000 (UTC)
Received: by mail-ua1-f53.google.com with SMTP id z7so1758542uai.6
 for <nouveau@lists.freedesktop.org>; Mon, 30 Mar 2020 04:38:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fxvcTUTJ8FVfXlWWV6fjj9SHPjNREoRZMz05eUWHgac=;
 b=AjqUYnybsM8e0t2xYKJyA5m9TyCdJ/53q6w67dXHpOUer7HjJgslm1iBFioR/7mZxM
 noE592kJsG8RIE/OaevLhEmpd7X7PAwOaLReeuIgmmIvp7bHvsUOuLIeBmDGC3Z1/0yD
 4RpXUP9LPhXqXT0UYHCJqcCz6jxcPgWH6o/T5QdLa6SXQTR2DfvD8gcM+XfzMaDl03xW
 beJwZ0gfIaq0ODidNH9DDTqonEhEGfIqxTTjS/5+ivU6xj18VXuok/Au529aOOLfKQSL
 ot0ccU9V2vgSlCUsesx1gShUPXP7OBEAOU1eofTmj836ysmQt7Q/WjILfZzsY1hQnIOv
 62Pg==
X-Gm-Message-State: AGi0PuYZxKJhINJ7kHtfYrJ7HP8ukHPR0cw8ZIcM+F0o+c9ocHIUNdaI
 WFA0e8VMMVqSEmrSiDFPvd575OWGDEzyQS6jOz4=
X-Google-Smtp-Source: APiQypLVMz2HwFGtW1zRWHTJxNxKicdTNTDx+JR/AbwNmYJNgTrMoICIpQCDUtlEINbcv3DjOhuVCZHVX0Ds4zfvGJg=
X-Received: by 2002:ab0:770d:: with SMTP id z13mr7581786uaq.58.1585568309059; 
 Mon, 30 Mar 2020 04:38:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAMix8LH00FU9VmT1uGXhTN+PiCM+i8J1uk=Ps-Fdy9jXmN3TVQ@mail.gmail.com>
In-Reply-To: <CAMix8LH00FU9VmT1uGXhTN+PiCM+i8J1uk=Ps-Fdy9jXmN3TVQ@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Mon, 30 Mar 2020 07:38:17 -0400
Message-ID: <CAKb7UvjALZp1mYwxkTeU=HLCwDt42ztFasRDv3YM0WHyNPKGNQ@mail.gmail.com>
To: =?UTF-8?Q?Jes=C3=BAs_J=2E_Guerrero_Botella?=
 <jesus.guerrero.botella@gmail.com>
Subject: Re: [Nouveau] Status of GF108GLM [NVS 5200M]
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

WWVzLCBHRjEwOCBpcyBGZXJtaSAoRiA9IEZlcm1pKS4gUmVjbG9ja2luZyBpcyBjdXJyZW50bHkg
bm90IGF2YWlsYWJsZQpmb3IgdGhhdCBnZW5lcmF0aW9uLCB1bmZvcnR1bmF0ZWx5LiBZb3Ugc2hv
dWxkIGJlIGFibGUgdG8gb3RoZXJ3aXNlCnVzZSB5b3VyIEdQVSBqdXN0IGZpbmUsIGJ1dCBJJ20g
Z3Vlc3NpbmcgaXQnbGwgY29tZSB1cCBpbiB0aGUgIjA3IgpzdGF0ZSB3aGVuIGl0IHBvd2VycyBv
biAoaW4gdGhlIHN0YXRlIGFzLWlzIGl0IGFwcGVhcnMgcG93ZXJlZCBvZmYsCndoaWNoIGl0IHdp
bGwgZG8gYXV0b21hdGljYWxseSB3aGVuIG5vdCBpbiB1c2UpLCB3aGljaCBhcyB5b3UgY2FuIHNl
ZQppcyBhIGZyYWN0aW9uIG9mIHRoZSB0b3RhbCBHUFUgYXZhaWxhYmxlIHBlcmYuCgpGb3IgZXhh
bXBsZSBgRFJJX1BSSU1FPTEgZ2x4aW5mb2Agc2hvdWxkIHNob3cgeW91IHRoYXQgaXQncyB1c2lu
ZyBub3V2ZWF1LgoKVGhlcmUncyBhIHZlcnkgZXhwZXJpbWVudGFsIGJyYW5jaCB0aGF0IGRvZXMg
ZW5hYmxlIHJlY2xvY2tpbmcgZm9yCkZlcm1pIGF0IGh0dHBzOi8vZ2l0aHViLmNvbS9za2VnZ3Ni
L25vdXZlYXUvY29tbWl0cy9kZXZlbC1jbGsgLgpIb3dldmVyIEkgYmVsaWV2ZSBpdCB3YXMgb25s
eSB0ZXN0ZWQgd2l0aCBhIHNpbmdsZSBHUFUsIGFuZCBteSB0ZXN0aW5nCndpdGggYW4gaWRlbnRp
Y2FsIHN1Y2ggR1BVIHdhcyBuZWdhdGl2ZS4gT24gdGhlIG90aGVyIGhhbmQsIHlvdSBkb24ndApo
YXZlIGEgZGlzcGxheSBoYW5naW5nIG9mZiB0aGUgY2FyZCwgd2hpY2ggZ3JlYXRseSBpbmNyZWFz
ZXMgY2hhbmNlcwpvZiBzdWNjZXNzLiBGZWVsIGZyZWUgdG8gam9pbiAjbm91dmVhdSBvbiBpcmMu
ZnJlZW5vZGUubmV0IGlmIHlvdSBwbGFuCm9uIGV4cGxvcmluZyB0aGlzLgoKQ2hlZXJzLAoKICAt
aWxpYQoKT24gTW9uLCBNYXIgMzAsIDIwMjAgYXQgMzoyMiBBTSBKZXPDunMgSi4gR3VlcnJlcm8g
Qm90ZWxsYQo8amVzdXMuZ3VlcnJlcm8uYm90ZWxsYUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGVs
bG8uCj4KPiBJIGFtIG5vdCBzdWJzY3JpYmVkIHRvIHRoZSBsaXN0LCBzbywgcGxlYXNlLCBpZiBJ
IGRvIGFueXRoaW5nIHdyb25nCj4ganVzdCBsZXQgbWUga25vdyBwb2xpdGVseSBhbmQgSSdsbCB0
cnkgdG8gaW1wcm92ZSA6KQo+Cj4gSSBqdXN0IHdhbnQgdG8ga25vdyBpZiB0aGVyZSdzIGFueSBi
cmFuY2ggb2Ygbm91dmVhdSB2ZXJzaW9uIHRoYXQgd2lsbAo+IHdvcmsgd2l0aCB0aGlzIGNoaXAu
IGxzcGNpIGxpc3RzIGl0IGFzOgo+Cj4gMDE6MDAuMCBWR0EgY29tcGF0aWJsZSBjb250cm9sbGVy
OiBOVklESUEgQ29ycG9yYXRpb24gR0YxMDhHTE0gW05WUwo+IDUyMDBNXSAocmV2IGExKQo+Cj4g
SSB0aGluayBpdCdzIEZlcm1pLCBidXQgSSBhbSBub3Qgc3VyZS4gV2hlbiBJIHRyeSB0byBjaGFu
Z2UgcHN0YXRlIGl0IHNheXM6Cj4KPiAjIExDX0FMTD1DIGVjaG8gJzBmJyA+IC9zeXMva2VybmVs
L2RlYnVnL2RyaS8xL3BzdGF0ZQo+IGJhc2g6IGVjaG86IHdyaXRlIGVycm9yOiBGdW5jdGlvbiBu
b3QgaW1wbGVtZW50ZWQKPiAjIExDX0FMTD1DIGNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy9kcmkvMS9w
c3RhdGUKPiAwMzogY29yZSA1MCBNSHogbWVtb3J5IDEzNSBNSHoKPiAwNzogY29yZSAyMDIgTUh6
IG1lbW9yeSAzMjQgTUh6Cj4gMGY6IGNvcmUgNjcyIE1IeiBtZW1vcnkgMTU2OSBNSHoKPiBBQzog
Y29yZSAwIE1IeiBtZW1vcnkgMCBNSHoKPgo+IEl0J3Mgd29ydGggbm90aW5nIHRoYXQncyBhIHNl
Y29uZGFyeSBncHUuIEkganVzdCB1c2UgdGhlIGludGVsIGNoaXAKPiBmb3IgZXZlcnlkYXkncyB3
b3JrLCBidXQgSSBoYXZlIHNvbWUgZnJlZSBkYXlzIGFuZCBJIGFtIHRyeWluZyB0byBnZXQKPiB0
aGUgc2Vjb25kYXJ5IG9uZSB3b3JraW5nIGFuZCBwdXQgaXQgdG8gZ29vZCB1c2UsIGlmIHBvc3Np
YmxlLgo+Cj4gVGhhbmtzIGZvciBhbnkgaGVscCB5b3UgY2FuIHByb3ZpZGUuIFBsZWFzZSwgQ0Mg
bWUsIGFzIHNhaWQsIEkgYW0gbm90Cj4gc3Vic2NyaWJlZCB0byB0aGUgbGlzdCBldmVuIHRob3Vn
aCBJJ2xsIHRyeSB0byBrZWVwIGFuIGV5ZSBvbiB0aGlzLgo+Cj4KPiAtLQo+IEplc8O6cyBHdWVy
cmVybyBCb3RlbGxhCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBOb3V2ZWF1IG1haWxpbmcgbGlzdAo+IE5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2
ZWF1Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZl
YXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
