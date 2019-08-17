Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E92C90BD9
	for <lists+nouveau@lfdr.de>; Sat, 17 Aug 2019 03:05:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E55F6E9BA;
	Sat, 17 Aug 2019 01:05:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0DD36E9BA
 for <nouveau@lists.freedesktop.org>; Sat, 17 Aug 2019 01:05:47 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id 16so6102202oiq.6
 for <nouveau@lists.freedesktop.org>; Fri, 16 Aug 2019 18:05:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z8ENTg05csYFB6EnyO7TkyjuL36iJBl01ajqYg4+H7c=;
 b=TXUmk/TFJVb5EBGLWOuhBi4CVXMbI7e60xfNIAI5vhjHm9LHM9WK4Nf7tOlFKJRgkG
 sWIiV+yQY5n2WILDooTVdZ+oA+5+ybmMHi0cxcCuue8X9H0gOvxtrtrcQNy9LNIyD7Li
 4qS6fWpIvahlU5DcbBLef29oJ1FYUkCgF1aBGlwDmnf1D8vj2DALCp8beiqB3c0PzDpd
 wvVwwt15JCmVFV/jeJ7KzIU3EE8w0yhL9wZqMrS1xg1j4qA4aIgkFJwKGYVpwRIneqb6
 +oTx6CGX3PUyN0O2dYbGP9mdjt/i4UnysU3ojt/Mg1D0fTillWfUk8h+pcP5SQ0cn6wT
 NRdg==
X-Gm-Message-State: APjAAAUAQ4nkZJ0M5LHVC2u2B6OvA41SbMJswDnFWCK21VQHanh3Dhmm
 8qC6/oObpND82Pui5kZ5+vcXi+tvzyTj9lQEzn1jsA==
X-Google-Smtp-Source: APXvYqxAF+wfaMajL9Gg1WX4ibGOmCi7WYnh2/AlAm+7FMG2H8BiEHyYTuL/n4V5iTSQD2enFfVICFERyTQ8sCv5yDA=
X-Received: by 2002:aca:c453:: with SMTP id u80mr7036181oif.8.1566003946880;
 Fri, 16 Aug 2019 18:05:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190807150214.3629-1-rcampbell@nvidia.com>
 <20190808070701.GC29382@lst.de>
 <0b96a8d8-86b5-3ce0-db95-669963c1f8a7@nvidia.com>
 <20190810111308.GB26349@lst.de>
 <1a84e6b6-31e6-6955-509f-9883f4a7a322@nvidia.com>
 <20190816071132.GA7513@lst.de>
In-Reply-To: <20190816071132.GA7513@lst.de>
From: Ben Skeggs <bskeggs@redhat.com>
Date: Sat, 17 Aug 2019 11:05:36 +1000
Message-ID: <CABDvA=n4Y0QticHZowEWFOqiEB3p99nV71GvHAySYdkcgw-Aow@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [Nouveau] [PATCH] nouveau/hmm: map pages after migration
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgNToxMSBQTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxz
dC5kZT4gd3JvdGU6Cj4KPiBPbiBNb24sIEF1ZyAxMiwgMjAxOSBhdCAxMjo0MjozMFBNIC0wNzAw
LCBSYWxwaCBDYW1wYmVsbCB3cm90ZToKPiA+Cj4gPiBPbiA4LzEwLzE5IDQ6MTMgQU0sIENocmlz
dG9waCBIZWxsd2lnIHdyb3RlOgo+ID4+IE9uIHNvbWV0aGluZyB2YWd1ZWx5IHJlbGF0ZWQgdG8g
dGhpcyBwYXRjaDoKPiA+Pgo+ID4+IFlvdSB1c2UgdGhlIE5WSUZfVk1NX1BGTk1BUF9WMF9WKiBk
ZWZpbmVzIGZyb20gbnZpZi9pZjAwMGMuaCwgd2hpY2ggYXJlCj4gPj4gYSBsaXR0bGUgb2RkIGFz
IHdlIG9ubHkgZXZlciBzZXQgdGhlc2UgYml0cywgYnV0IHRoZXkgYWxzbyBkb24ndCBzZWVtCj4g
Pj4gdG8gYXBwZWFyIHRvIGJlIGluIHZhbHVlcyB0aGF0IGFyZSBkaXJlY3RseSBmZWQgdG8gdGhl
IGhhcmR3YXJlLgo+ID4+Cj4gPj4gT24gdGhlIG90aGVyIGhhbmQgbW11L3ZtbS5oIGRlZmluZXMg
YSBzZXQgb2YgTlZJRl9WTU1fUEZOTUFQX1YwXyoKPiA+Cj4gPiBZZXMsIEkgc2VlIE5WS01fVk1N
X1BGTl8qCj4gPgo+ID4+IGNvbnN0YW50cyB3aXRoIHNpbWlsYXIgbmFtZXMgYW5kIGlkZW50aWNh
bCB2YWx1ZXMsIGFuZCB0aG9zZSBhcmUgdXNlZAo+ID4+IGluIG1tdS92bW1ncDEwMC5jIGFuZCB3
aGF0IGFwcGVhcnMgdG8gZmluYWxseSBkbyB0aGUgbG93LWxldmVsIGRtYQo+ID4+IG1hcHBpbmcg
YW5kIHRhbGtpbmcgdG8gdGhlIGhhcmR3YXJlLiAgQXJlIHRoZXNlIHR3byBzZXRzIG9mIGNvbnN0
YW50cwo+ID4+IHN1cHBvc2VkIHRvIGJlIHRoZSBzYW1lPyAgQXJlIHRoZSBhY3R1YWwgaGFyZHdh
cmUgdmFsdWVzIG9yIGp1c3QgYQo+ID4+IGRyaXZlciBpbnRlcm5hbCBpbnRlcmZhY2U/Cj4gPgo+
ID4gSXQgbG9va3MgYSBiaXQgb2RkIHRvIG1lIHRvby4KPiA+IEkgZG9uJ3QgcmVhbGx5IGtub3cg
dGhlIHN0cnVjdHVyZS9oaXN0b3J5IG9mIG5vdXZlYXUuCj4gPiBQZXJoYXBzIEJlbiBTa2VnZ3Mg
Y2FuIHNoZWQgbW9yZSBsaWdodCBvbiB5b3VyIHF1ZXN0aW9uLgo+Cj4gQmVuLCBkbyB5b3UgaGF2
ZSBhbnkgaW5zaWdodHMgb24gdGhlc2UgY29uc3RhbnRzPwpUaG9zZSBzZXRzIG9mIGNvbnN0YW50
cyBhcmUgKGN1cnJlbnRseSkgc3VwcG9zZWQgdG8gYmUgdGhlIHNhbWUgdmFsdWUuClRoZXkgZG9u
J3QgbmVjZXNzYXJpbHkgbWFwIHRvIHRoZSBIVyBkaXJlY3RseSBhdCB0aGlzIHN0YWdlLCBhbmQK
c29tZXRoaW5nIGRpZmZlcmVudCB3aWxsIGxpa2VseSBiZSBkb25lIGluIHRoZSBmdXR1cmUgYXMg
SFcgY2hhbmdlcy4KCkJlbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
