Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B6C103432
	for <lists+nouveau@lfdr.de>; Wed, 20 Nov 2019 07:11:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A07E6E14A;
	Wed, 20 Nov 2019 06:11:27 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC2D26E134
 for <nouveau@lists.freedesktop.org>; Wed, 20 Nov 2019 06:11:25 +0000 (UTC)
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-G6kne2tvOwyD7N8JqEx_JQ-1; Wed, 20 Nov 2019 01:11:22 -0500
Received: by mail-ot1-f70.google.com with SMTP id v14so24270otf.20
 for <nouveau@lists.freedesktop.org>; Tue, 19 Nov 2019 22:11:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dpJGfZx3Cj0lDz0Nl34BnLGPHmNtsdaIhy7QBlSYdNA=;
 b=VZZcb3x0DCkz5spdVJ1mBFizJtH90xgMa49KaVP6mnG68/SBAQAOuXotM74LEd6OXq
 qhxinFlQt+p60HFmUfES7hQaLJ83q1beBBgVOLuoo94gvijpgAIPBn5xHFgPnoi9KElB
 kvwj6A15fguccaKt+yAUkHeW0xtwqeeHU1QM8IA8+a4s/meNuW3UrhFfm5QiF28n6cTz
 W1Z7DO+ybzIw1/X5o/Y6EqUpvLPnJ4YAyXzWuNbsHUBxF9Vlo1PYm6apiKnAAFoIp99L
 LJ8DCv3cg7gdaLZMBLRJHGeFGe1lBxOzSb5dvF7ti6WuqRsjVo6kNY8dSFhvV8+U8Ghi
 OnLw==
X-Gm-Message-State: APjAAAV81ZP6Mu8AkWKB9OaMb3dPK87lKD+Ugt72yyep2pUbyrF8XczB
 J8dSbTPZU5pxv0BcEatzKAo46p+KYZyibwv1Z+q1fS8fUroNnZHoDKpmRB9+2i7dekDStdZldgw
 kIKWWqeEz7BXeMXpMB202JBMRr6EklqATYebS7g0eZA==
X-Received: by 2002:aca:55d3:: with SMTP id j202mr1325402oib.152.1574230281887; 
 Tue, 19 Nov 2019 22:11:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqyq+wH+KgxAVK0czEL+ebk7GljLn6+LLUP630iCkchv5lxYAyJQL9dIazj41yNNSbugAaDCvWwJ12nCjy+zSd0=
X-Received: by 2002:aca:55d3:: with SMTP id j202mr1325389oib.152.1574230281642; 
 Tue, 19 Nov 2019 22:11:21 -0800 (PST)
MIME-Version: 1.0
References: <20191102175637.3065-1-thierry.reding@gmail.com>
 <20191118134449.GG2246533@ulmo>
In-Reply-To: <20191118134449.GG2246533@ulmo>
From: Ben Skeggs <bskeggs@redhat.com>
Date: Wed, 20 Nov 2019 16:11:10 +1000
Message-ID: <CABDvA==b3g0S1i1xG_Ycjs15LbGUAgKmrLm6pqf+QFdv_qQk9A@mail.gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
X-MC-Unique: G6kne2tvOwyD7N8JqEx_JQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574230284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MHQgPT52W5BFw9nmU9WAz3e2f1ymk2wUifEnHSUCrRo=;
 b=hogL6FLJKxw4H0dMXy12A8QfzWtX9QHT7yqImZtnV+8s4BpWbuLeafv5x2/bbuStirQZew
 oIG2y6SeGWjiUngoX9xT6l2XnYLjFKIzjqJ1djHtjdbFDoGyG4G2DBbqNkisu2ItvnGBQt
 2A49tW10tLVcLQeqm91U7YGITWySws0=
Subject: Re: [Nouveau] [PATCH v2 0/9] drm/nouveau: Various fixes for GP10B
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
Cc: nouveau <nouveau@lists.freedesktop.org>, Joerg Roedel <joro@8bytes.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMTgsIDIwMTkgYXQgMTE6NDUgUE0gVGhpZXJyeSBSZWRpbmcKPHRoaWVycnku
cmVkaW5nQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBTYXQsIE5vdiAwMiwgMjAxOSBhdCAwNjo1
NjoyOFBNICswMTAwLCBUaGllcnJ5IFJlZGluZyB3cm90ZToKPiA+IEZyb206IFRoaWVycnkgUmVk
aW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Cj4gPgo+ID4gSGkgQmVuLAo+ID4KPiA+IGhlcmUncyBh
IHJldmlzZWQgc3Vic2V0IG9mIHRoZSBwYXRjaGVzIEkgaGFkIHNlbnQgb3V0IGEgY291cGxlIG9m
IHdlZWtzCj4gPiBhZ28uIEkndmUgcmV3b3JrZWQgdGhlIEJBUjIgYWNjZXNzZXMgaW4gdGhlIHdh
eSB0aGF0IHlvdSBoYWQgc3VnZ2VzdGVkLAo+ID4gd2hpY2ggYXQgbGVhc3QgZm9yIEdQMTBCIHR1
cm5lZCBvdXQgdG8gYmUgZmFpcmx5IHRyaXZpYWwgdG8gZG8uIEkgaGF2ZQo+ID4gbm90IGxvb2tl
ZCBpbiBkZXRhaWwgYXQgdGhpcyBmb3IgR1YxMUIgeWV0LCBidXQgYSBjdXJzb3J5IGxvb2sgc2hv
d2VkCj4gPiB0aGF0IEJBUjIgaXMgYWNjZXNzZWQgaW4gbW9yZSBwbGFjZXMsIHNvIHRoZSBlcXVp
dmFsZW50IGZvciBHVjExQiBtaWdodAo+ID4gYmUgYSBiaXQgbW9yZSBpbnZvbHZlZC4KPiA+Cj4g
PiBPdGhlciB0aGFuIHRoYXQsIG5vdCBhIGxvdCBoYXMgY2hhbmdlZCBzaW5jZSB0aGVuLiBJJ3Zl
IGFkZGVkIGEgY291cGxlCj4gPiBvZiBwcmVjdXJzb3J5IHBhdGNoZXMgdG8gYWRkIElPTU1VIGhl
bHBlciBkdW1taWVzIGZvciB0aGUgY2FzZSB3aGVyZQo+ID4gSU9NTVUgaXMgZGlzYWJsZWQgKGFz
IHN1Z2dlc3RlZCBieSBCZW4gRG9va3MpLgo+ID4KPiA+IEpvZXJnLCBpdCdkIGJlIGdyZWF0IGlm
IHlvdSBjb3VsZCBnaXZlIGFuIEFja2VkLWJ5IG9uIHRob3NlIHR3byBwYXRjaGVzCj4gPiBzbyB0
aGF0IEJlbiBjYW4gcGljayB0aGVtIGJvdGggdXAgaW50byB0aGUgTm91dmVhdSB0cmVlLiBBbHRl
cm5hdGl2ZWx5IEkKPiA+IGNhbiBwdXQgdGhlbSBib3RoIGludG8gYSBzdGFibGUgYnJhbmNoIGFu
ZCBzZW5kIGEgcHVsbCByZXF1ZXN0IHRvIGJvdGgKPiA+IG9mIHlvdS4gT3IgeWV0IGFub3RoZXIg
YWx0ZXJuYXRpdmUgd291bGQgYmUgZm9yIEpvZXJnIHRvIGFwcGx5IHRoZW0gbm93Cj4gPiBhbmQg
QmVuIHRvIHdhaXQgZm9yIHY1LjUtcmMxIHVudGlsIGhlIHBpY2tzIHVwIHRoZSByZXN0LiBBbGwg
b2YgdGhvc2UKPiA+IHdvcmsgZm9yIG1lLgo+Cj4gSGkgSm9lcmcsIEJlbiwKPgo+IGRvIHlvdSBn
dXlzIGhhdmUgYW55IGZ1cnRoZXIgY29tbWVudHMgb24gdGhpcyBzZXJpZXM/IEkndmUgZ290IGFu
Cj4gdXBkYXRlZCBwYXRjaCB0byBzaWxlbmNlIHRoZSB3YXJuaW5nIHRoYXQgdGhlIGtidWlsZCBy
b2JvdCBmbGFnZ2VkLCBzbwo+IGlmIHRoZXJlIGFyZSBubyBvdGhlciBjb21tZW50cyBJIGNhbiBz
ZW5kIGEgZmluYWwgdjMgb2YgdGhlIHNlcmllcy4KSSdtIG9uIGxlYXZlIGF0IHRoZSBtb21lbnQu
ICBCdXQgdGhlIG5vdXZlYXUgZml4ZXMgbG9vayBmaW5lIHRvIG1lIGFuZApJJ20gaGFwcHkgdG8g
cGljayB0aGVtIHVwIG9uY2UgeW91IHNlbmQgYSB2MywgYW5kIGFsbG93IEplb3JnIHRvIGFwcGx5
CnRoZSByZXN0IHRocm91Z2ggaGlzIHRyZWUuCgpUaGFua3MsCkJlbi4KCj4KPiBUaGllcnJ5Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1h
aWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
