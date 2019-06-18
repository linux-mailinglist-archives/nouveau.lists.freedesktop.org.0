Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AECEC4AB10
	for <lists+nouveau@lfdr.de>; Tue, 18 Jun 2019 21:36:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 404736E1E8;
	Tue, 18 Jun 2019 19:36:34 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
 [209.85.222.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F4126E1E8
 for <nouveau@lists.freedesktop.org>; Tue, 18 Jun 2019 19:36:32 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id 34so7253507uar.8
 for <nouveau@lists.freedesktop.org>; Tue, 18 Jun 2019 12:36:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+abyxz+5hBr0wvm/+lLNAT/M8CMhQDFmlbu3Pl08suc=;
 b=tFllPfjDIba5wRWE+7mbxguoervDtpjhbkyoPZqiMyrxdOyiDgOJMpQoR16Q9HitEi
 UbYj+nCHyOZumrrXpZ6AFJZObsLwdpr3FEe/6KAfX5adEdCWPK49OBfJ66gJSL1tIwyM
 bktsWnqbq1Wjs4IzTdJTQ0a96uj/l7AoCtBk2vy688bi4L/kFicchrNM+5PGGsk/cEtg
 1g7pYA6EvyMizZ78dXD4JXcJSucFBZfjHZWxZ3jge4xM4TlV2ZnNkYi5teKN/Odr0xVL
 bm6hq0O+wxFrDTNESjkiuvBkrnv6HvK3Q+B0UobMEfAgT4yxw8cjji9uq1gOHN0tg78t
 ZzmA==
X-Gm-Message-State: APjAAAW1jqyCUX2VYKMYlO6WAEPkM0EFqUXpC3E4bwMNYctFz5Lk2hi3
 NRzy/hXqhiYx0wZap/luuh/1CkpWyR/uCOCBNr12BQ==
X-Google-Smtp-Source: APXvYqyTWZK5xEFRGXnhC17H7xP2+fBeJ7tbFHJglB/y6glP50GdB8W3314teNAuFZqurVCP5GJvO7hW3c0oCjE6p6I=
X-Received: by 2002:a9f:31a2:: with SMTP id v31mr11807328uad.15.1560886591784; 
 Tue, 18 Jun 2019 12:36:31 -0700 (PDT)
MIME-Version: 1.0
References: <trinity-60f06d18-ea3c-49a9-8a25-d6aa7f233436-1560886110718@3c-app-gmx-bs22>
In-Reply-To: <trinity-60f06d18-ea3c-49a9-8a25-d6aa7f233436-1560886110718@3c-app-gmx-bs22>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Tue, 18 Jun 2019 15:36:20 -0400
Message-ID: <CAKb7UvifuLNe_Nq+7oGHTzgmo4a3mQ1kg0QX-kKfdABB8Ok_Hg@mail.gmail.com>
To: Harald Harders <harald.harders@gmx.de>
Subject: Re: [Nouveau] Instable graphics with GeForce GT 730M,
 especially on external monitor
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
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

V2hpY2gga2VybmVsIGRpZCB5b3UgdXBkYXRlIGZyb20gYW5kIHRvPyBBbHNvLCA0LjEyIGlzIGZh
aXJseSBvbGQgLQpjYW4geW91IHRyeSBsaWtlIGEgbGl2ZSB1c2IgaW1hZ2Ugb2Ygc29tZSBkaXN0
cm8gd2l0aCBlLmcuIGEgNS4wCmtlcm5lbCBvciBzb21ldGhpbmc/CgpIb3cgZG8geW91IGNvbm5l
Y3QgdGhlIGV4dGVybmFsIHNjcmVlbj8gSXMgaXQgbGlrZSBhIERQIHBvcnQgd2l0aCBhbgpvcHRp
b25hbCBkb2NrIHdpdGggYSB2YXJpZXR5IG9mIGFjdGl2ZSBEUCBhZGFwdGVycz8gT3IgaXMgdGhl
cmUgYSBEUCsrCnBvcnQgdGhhdCB5b3UncmUgcGx1Z2dpbmcgYSBEUCA8LT4gSERNSSBwYXNzaXZl
IGFkYXB0ZXIgaW50bz8KCk9uIFR1ZSwgSnVuIDE4LCAyMDE5IGF0IDM6MjggUE0gSGFyYWxkIEhh
cmRlcnMgPGhhcmFsZC5oYXJkZXJzQGdteC5kZT4gd3JvdGU6Cj4KPiBEZWFyIGFsbCwKPgo+IEkg
aGF2ZSByZWNlbnRseSB1cGRhdGVkIG15IExlbm92byBUNDQwcCB3aXRoIGEgZHVhbCBncmFwaGlj
cyBjYXJkIChJbnRlbCBDb3JlICsgR2VGb3JjZSBHVCA3MzBNKSB0byBPcGVuU1VTRSBMZWFwIDE1
LjEuIFNpbmNlIHRoZW4sIHRoZSBleHRlcm5hbCBzY3JlZW4gKGNvbm5lY3RlZCBlaXRoZXIgdmlh
IFZHQSwgRFZJLCBIRE1JLCBvciBEaXNwbGF5UG9ydCkgaGFzIGEgdmVydGljYWxseSBzdHJldGNo
ZWQgb3V0cHV0IHdoaWNoIGp1bXBzIGhvcml6b250YWxseSBpbiBoaWdoIGZyZXF1ZW5jeS4gV2hl
bmV2ZXIgdG91Y2hpbmcgYW55IHNldHRpbmdzIGZvciB0aGUgYnVpbHQgaW4gZGlzcGxheSAoZS5n
LiBieSBnbm9tZS1jb250cm9sLWNlbnRlciksIGFsc28gdGhpcyBzY3JlZW4gc3RhcnRzIGluY29y
cmVjdCBkaXNwbGF5LiBTb21ldGltZXMsIGhvd2V2ZXIsIGFsc28gdGhlIGV4dGVybmFsIHNjcmVl
biB3b3JrcyBhcyBleHBlY3RlZC4KPgo+IEluc3RhbGxlZCBkcml2ZXIgdmVyc2lvbiBpcyAob25s
eSAyRCBpbnN0YWxsZWQpOgo+IHhmODYtdmlkZW8tbm91dmVhdTogMS4wLjE1LWxwMTUxLjQuMQo+
IGxpYnZkcGF1X25vdXZlYXU6IDE4LjMuMi1scDE1MS4yMi40Cj4gbGliZHJtX25vdXZlYXUyOiAy
LjQuOTctbHAxNTEuMS4xCj4KPiBJIGhhdmUgZm9sbG93ZWQgeW91ciBpbnN0cnVjdGlvbnMgb24g
dGhlIFRyb3VibGVTaG9vdGluZyBwYWdlLCBObyBzaWducyBmb3IgTlZJRElBIGRyaXZlcnMgcnVu
bmluZywgZXZlcnl0aGluZyBhcHBlYXJzIHRvIGJlIG9rYXkuIE1pbmltYWwgeG9yZy5jb25mIGRp
ZCBub3Qgd29yaywgc2NyZWVuc2hvdHMgYXJlIG9rYXkuVW5mb3J0dW5hdGVseSwgSSBmYWlsZWQg
aW4gaW5zdGFsbGluZyB0aGUgbW9zdCByZWNlbnQgbm91dmVhdSB2ZXJzaW9uIChuZWl0aGVyIC9s
aWIvbW9kdWxlcy80LjEyLjE0LWxwMTUxLjI4LjQtZGVmYXVsdC9zb3VyY2Ugbm9yIC9saWIvbW9k
dWxlcy80LjEyLjE0LWxwMTUxLjI4LjQtZGVmYXVsdC9idWlsZCBhcmUgcHJlc2VudCBvbiBteSBj
b21wdXRlciBldmVuIHRob3VnaCBJIGhhdmUgaW5zdGFsbGVkIHRoZSBLZXJuZWwgc291cmNlcyku
IFRoZSBpbnN0YWxsZWQgdmVyc2lvbiBpcyBzdGlsbCBxdWl0ZSBuZXcsIGlzbid0IGl0Pwo+Cj4g
SSBzdXNwZWN0IHRoYXQgSSBtaWdodCBoYXZlIHRoZSBpc3N1ZSB5b3UgZGVzY3JpYmUgdW5kZXIg
IkJsYW5rIG1vbml0b3IsIGZsaWNrZXIsIHNub3csIG9yIG90aGVyIHJhbmRvbSBsaXZlIGltYWdl
IGNvcnJ1cHRpb24iLiBJIHdvdWxkIGxpa2UgdG8gbWFrZSBzdXJlLCBob3dldmVyLiBBbmQgc2lu
Y2UgeW91IHdhcm4gd2l0aCByZWdhcmRzIHRvIHBvdGVudGlhbCBwZXJtYW5lbnQgZGFtYWdlLCBJ
IHdvdWxkIGxpa2UgdG8gbWFrZSBzdXJlLCBmaXJzdC4KPiBDYW4geW91IGNvbmZpcm0gdGhhdCBp
dCBzaG91bGQgYmUgdGhpcyBpc3N1ZT8gT3IgYXJlIHRoZXJlIGFueSBvdGhlciB0aGluZ3MgSSBz
aG91bGQgdHJ5IGZpcnN0Pwo+Cj4gQmVzdCByZWdhcmRzCj4gSGFyYWxkCj4KPgo+Cj4KPgo+Cj4K
Pgo+Cj4gbG9zZTovaG9tZS9oYXJkZXJzL2Rvd25sb2FkL25vdXZlYXUvZHJtICMgbHNwY2kgfCBn
cmVwIC1pIHZnYQo+IDAwOjAyLjAgVkdBIGNvbXBhdGlibGUgY29udHJvbGxlcjogSW50ZWwgQ29y
cG9yYXRpb24gNHRoIEdlbiBDb3JlIFByb2Nlc3NvciBJbnRlZ3JhdGVkIEdyYXBoaWNzIENvbnRy
b2xsZXIgKHJldiAwNikKPiAwMjowMC4wIFZHQSBjb21wYXRpYmxlIGNvbnRyb2xsZXI6IE5WSURJ
QSBDb3Jwb3JhdGlvbiBHSzIwOE0gW0dlRm9yY2UgR1QgNzMwTV0gKHJldiBhMSkKPgo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTm91dmVhdSBtYWls
aW5nIGxpc3QKPiBOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2
ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
