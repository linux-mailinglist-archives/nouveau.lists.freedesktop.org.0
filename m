Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D0F2EF9F0
	for <lists+nouveau@lfdr.de>; Fri,  8 Jan 2021 22:10:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 609236E8CB;
	Fri,  8 Jan 2021 21:10:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32F916E8C2
 for <nouveau@lists.freedesktop.org>; Fri,  8 Jan 2021 20:15:04 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id 3so9430132wmg.4
 for <nouveau@lists.freedesktop.org>; Fri, 08 Jan 2021 12:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QeXXbkShC0KTgz4n+dtT2axDbKBu7SEofVtSgTaHdlA=;
 b=EpUldkEu63PuzXZYe8Jr/P+khJQOipAojDEohRiyHCTrwR0wQhBpn8uRQqxNWXdbFI
 L+dS4H5R6ZR6Nq1EnbNFG4xu1Ac1uz9nb8rmmiRJbO1/yFtULhfWjvOc+2S1rkJnnPpu
 8Cwz3Ikl8cVre8c+OOmS2DtGaPSKre5SgJiCEFW9g5mO9CXo9AnmUwcr8T0m/4djIU/b
 ePHEJmMElk7oomdFJSXWhoidk98MWCrwHKc57ySEpTtXRKe6wXQwusjsoBXeE9/zJaH8
 VeS5jFRmNpp+hqFVRac36sBQtcWD0EQMs+ioyWScgxcBIkYyXe3EQSenusSG1dL1dbhZ
 0ZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QeXXbkShC0KTgz4n+dtT2axDbKBu7SEofVtSgTaHdlA=;
 b=s0KvbdavLXfhXDfq/AOsv8BXzvkZlYnwlTZQjP/9xd9RKHkA1xeNaFEjhvD23IiSQW
 4qCuhmf1BZFJCTJ6MoWQLCu5VmJzyonrwhZAmR8f23XTV3Zg+o19hdbZeoC/gvPYn01U
 2J9uZPazXWaJ1OUJZoQ3rqGHCOdIMPQOY8ql9rfZoz9yopM22W/PLCg3yNj6USs31nv9
 ceFZA/jaE5ZFiX+F7YO0QMlCEtLnE4bjbsQFjmPTyssHADHstfyHgm8Ev9L/18Pk0gY4
 rSWgZPsqMYdACGYRldL3fqK2TULjzWdLZs1S3EZPjE0KFgGtvH7UQJaHi/WEuErT+zpf
 3KUw==
X-Gm-Message-State: AOAM5300v57v12ipGG/z4rWViS9nXr9G4O+zUFKcRKIBbFJBo7nL/P75
 jruF++QPK9lEiqSl7+B2i8KvaQ==
X-Google-Smtp-Source: ABdhPJwl3kU/DFu/+SHxqnLdc9NJoAEBkx5a1X6cfHiA0SIPK8+omrC1+fEQ6fahQl61Z3lNinh7/g==
X-Received: by 2002:a1c:c308:: with SMTP id t8mr4593743wmf.22.1610136902655;
 Fri, 08 Jan 2021 12:15:02 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id l8sm15598671wrb.73.2021.01.08.12.14.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 12:15:01 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri,  8 Jan 2021 20:14:17 +0000
Message-Id: <20210108201457.3078600-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 08 Jan 2021 21:10:28 +0000
Subject: [Nouveau] [PATCH 00/40] [Set 11] Rid W=1 warnings from GPU
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
Cc: Lewis Huang <Lewis.Huang@amd.com>, David Airlie <airlied@linux.ie>,
 Feifei Xu <Feifei.Xu@amd.com>, Mauro Rossi <issor.oruam@gmail.com>,
 dri-devel@lists.freedesktop.org, Qinglang Miao <miaoqinglang@huawei.com>,
 Wyatt Wood <wyatt.wood@amd.com>, Anthony Koo <Anthony.Koo@amd.com>,
 Charlene Liu <Charlene.Liu@amd.com>, Krunoslav Kovac <Krunoslav.Kovac@amd.com>,
 Sean Paul <sean@poorly.run>, Mikita Lipski <mikita.lipski@amd.com>,
 amd-gfx@lists.freedesktop.org, Eric Bernstein <eric.bernstein@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>, George Shen <george.shen@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 linux-arm-msm@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Kuogee Hsieh <khsieh@codeaurora.org>,
 nouveau@lists.freedesktop.org, Evan Quan <evan.quan@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Eryk Brol <eryk.brol@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 Igor Kravchenko <Igor.Kravchenko@amd.com>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

VGhpcyBzZXQgaXMgcGFydCBvZiBhIGxhcmdlciBlZmZvcnQgYXR0ZW1wdGluZyB0byBjbGVhbi11
cCBXPTEKa2VybmVsIGJ1aWxkcywgd2hpY2ggYXJlIGN1cnJlbnRseSBvdmVyd2hlbG1pbmdseSBy
aWRkbGVkIHdpdGgKbmlnZ2x5IGxpdHRsZSB3YXJuaW5ncy4KCjMwMCBvdXQgb2YgNTAwMCBsZWZ0
IQoKTGVlIEpvbmVzICg0MCk6CiAgZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvYmlvcy9pbml0OiBE
ZW1vdGUgb2J2aW91cyBhYnVzZSBvZiBrZXJuZWwtZG9jCiAgZHJtL25vdXZlYXUvZGlzcG52NTAv
ZGlzcDogUmVtb3ZlIHVudXNlZCB2YXJpYWJsZSAncmV0JwogIGRybS9tc20vZHAvZHBfZGlzcGxh
eTogUmVtb3ZlIHVudXNlZCB2YXJpYWJsZSAnaHBkJwogIGRybS9hbWQvYW1kZ3B1L2FtZGdwdV9p
aDogVXBkYXRlICdhbWRncHVfaWhfZGVjb2RlX2l2X2hlbHBlcigpJ3MKICAgIGZ1bmN0aW9uIGhl
YWRlcgogIGRybS9hbWQvYW1kZ3B1L3ZlZ2EyMF9paDogQWRkIG1pc3NpbmcgZGVzY3JpcHRpb25z
IGZvciAnaWgnIGFuZCBmaXgKICAgIHNwZWxsaW5nIGVycm9yCiAgZHJtL2FtZC9wbS9wb3dlcnBs
YXkvaHdtZ3IvcHJvY2Vzc19wcHRhYmxlc192MV8wOiBQcm92aWRlIGRlc2NyaXB0aW9uCiAgICBv
ZiAnY2FsbF9iYWNrX2Z1bmMnCiAgZHJtL2FtZC9wbS9wb3dlcnBsYXkvaHdtZ3IvcHBhdG9tY3Ry
bDogRml4IGRvY3VtZW50YXRpb24gZm9yCiAgICAnbXBsbF9wYXJhbScKICBkcm0vYW1kL3BtL3Bv
d2VycGxheS9od21nci92ZWdhMTJfaHdtZ3I6IEZpeCBsZWdhY3kgZnVuY3Rpb24gaGVhZGVyCiAg
ICBmb3JtYXR0aW5nCiAgZHJtL2FtZC9wbS9wb3dlcnBsYXkvaHdtZ3IvdmVnYTIwX2h3bWdyOiBG
aXggbGVnYWN5IGZ1bmN0aW9uIGhlYWRlcgogICAgZm9ybWF0dGluZwogIGRybS9hbWQvcG0vcG93
ZXJwbGF5L2h3bWdyL3NtdTdfaHdtZ3I6IEZpeCBmb3JtYXR0aW5nIGFuZCBzcGVsbGluZwogICAg
aXNzdWVzCiAgZHJtL2FtZC9wbS9wb3dlcnBsYXkvaHdtZ3IvaHdtZ3I6IE1vdmUgcHJvdG90eXBl
IGludG8gc2hhcmVkIGhlYWRlcgogIGRybS9hbWQvcG0vcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9o
d21ncjogRml4IGEgYnVuY2ggb2Yga2VybmVsLWRvYwogICAgZm9ybWF0dGluZyBpc3N1ZXMKICBk
cm0vYW1kL2Rpc3BsYXkvZGMvYmFzaWNzL2NvbnZlcnNpb246IERlbW90ZSBvYnZpb3VzIGtlcm5l
bC1kb2MgYWJ1c2UKICBkcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9kZWJ1Z2Zz
OiBEZW1vdGUgbm9uLWtlcm5lbC1kb2MKICAgIGNvbW1lbnQgYmxvY2tzCiAgZHJtL2FtZC9kaXNw
bGF5L2RjL2Jpb3MvY29tbWFuZF90YWJsZV9oZWxwZXI6IEZpeCBrZXJuZWwtZG9jCiAgICBmb3Jt
YXR0aW5nCiAgZHJtL2FtZC9kaXNwbGF5L2RjL2Jpb3MvY29tbWFuZF90YWJsZV9oZWxwZXIyOiBG
aXggbGVnYWN5IGZvcm1hdHRpbmcKICAgIHByb2JsZW1zCiAgZHJtL2FtZC9kaXNwbGF5L2RjL2Jp
b3MvYmlvc19wYXJzZXI6IE1ha2UgbG9jYWwgZnVuY3Rpb25zIHN0YXRpYwogIGRybS9hbWQvZGlz
cGxheS9kYy9iaW9zL2Jpb3NfcGFyc2VyOiBGaXggYSB3aG9sZSBidW5jaCBvZiBsZWdhY3kgZG9j
CiAgICBmb3JtYXR0aW5nCiAgZHJtL2FtZC9kaXNwbGF5L2RjL2Jpb3MvY29tbWFuZF90YWJsZTog
UmVtb3ZlIHVudXNlZCB2YXJpYWJsZQogIGluY2x1ZGU6IGRybTogZHJtX2F0b21pYzogTWFrZSB1
c2Ugb2YgJ25ld19wbGFuZV9zdGF0ZScKICBkcm0vYW1kL2Rpc3BsYXkvZGMvY2FsY3MvZGNlX2Nh
bGNzOiBSZW1vdmUgdW51c2VkIHZhcmlhYmxlcwogICAgJ3ZfZmlsdGVyX2luaXRfbW9kZScgYW5k
ICdzY2xrX2x2bCcKICBkcm0vYW1kL2Rpc3BsYXkvZGMvYmlvcy9iaW9zX3BhcnNlcjI6IEZpeCBz
b21lIGZvcm1hdHRpbmcgaXNzdWVzIGFuZAogICAgbWlzc2luZyBwYXJhbWV0ZXIgZG9jcwogIGRy
bS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2F1ZGlvOiBNYWtlIGZ1bmN0aW9uIGludm9rZWQgYnkg
cmVmZXJlbmNlCiAgICBzdGF0aWMKICBkcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9zdHJlYW1f
ZW5jb2RlcjogUmVtb3ZlIHVudXNlZCB2YXJpYWJsZQogICAgJ3JlZ3ZhbCcKICBkcm0vYW1kL2Rp
c3BsYXkvZGMvZGNlL2RjZV9saW5rX2VuY29kZXI6IE1ha2UgZnVuY3Rpb25zIGludm9rZWQgYnkK
ICAgIHJlZmVyZW5jZSBzdGF0aWMKICBkcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9jbG9ja19z
b3VyY2U6IEZpeCBmb3JtYXR0aW5nL3NwZWxsaW5nIG9mCiAgICB3b3J0aHkgZnVuY3Rpb24gaGVh
ZGVycwogIGRybS9hbWQvcG0vcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9od21ncjogRml4IHdvcnRo
eSBmdW5jdGlvbiBoZWFkZXJzLAogICAgZGVtb3RlIGJhcmVseSBkb2N1bWVudGVkIG9uZQogIGRy
bS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX3RyYW5zZm9ybTogUmVtb3ZlIDMgdW51c2VkL2xlZ2Fj
eSB2YXJpYWJsZXMKICBkcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9kbWN1OiBTdGF0aWNpZnkg
bG9jYWwgZnVuY3Rpb24gY2FsbAogICAgJ2RjZV9kbWN1X2xvYWRfaXJhbScKICBkcm0vYW1kL2Rp
c3BsYXkvZGMvZGNlL2RjZV9kbWN1OiBNb3ZlICdhYm1fZ2Fpbl9zdGVwc2l6ZScgdG8gb25seQog
ICAgc291cmNlIGZpbGUgaXQncyB1c2VkIGluCiAgZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2Vf
b3BwOiBNYWtlIGxvY2FsIGZ1bmN0aW9ucyBhbmQgb25lcyBpbnZva2VkCiAgICBieSByZWZlcmVu
Y2Ugc3RhdGljCiAgZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfYXV4OiBSZW1vdmUgdW51c2Vk
IGZ1bmN0aW9uCiAgICAnZ2V0X2VuZ2luZV90eXBlJwogIGRybS9ub3V2ZWF1L252a20vc3ViZGV2
L3ZvbHQvZ2syMGE6IERlbW90ZSBub24tY29uZm9ybWFudCBrZXJuZWwtZG9jCiAgICBoZWFkZXJz
CiAgZHJtL2FtZC9kaXNwbGF5L2RjL2Jpb3MvYmlvc19wYXJzZXI6IEZpeCBtaXNzcGVsbGluZyBv
ZiBmdW5jdGlvbgogICAgcGFyYW1ldGVyCiAgZHJtL2FtZC9kaXNwbGF5L2RjL2Jpb3MvY29tbWFu
ZF90YWJsZTogUmVtb3ZlIHVudXNlZCB2YXJpYWJsZSBhbmQKICAgIGFzc29jaWF0ZWQgY29tbWVu
dAogIGRybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2kyY19odzogTWFrZSBmdW5jdGlvbnMgY2Fs
bGVkIGJ5IHJlZmVyZW5jZQogICAgc3RhdGljCiAgZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2Vf
aTJjX3N3OiBNYWtlIGEgYnVuY2ggb2YgbG9jYWwgZnVuY3Rpb25zCiAgICBzdGF0aWMKICBkcm0v
YW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9wYW5lbF9jbnRsOiBSZW1vdmUgdW51c2VkIHZhcmlhYmxl
cwogICAgJ2JsX3B3bV9jbnRsJyBhbmQgJ3B3bV9wZXJpb2RfY250bCcKICBkcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNlL2RtdWJfcHNyOiBEZW1vdGUgbm9uLWNvbmZvcm1hbnQga2VybmVsLWRvYwogICAg
aGVhZGVycwogIGRybS9hbWQvZGlzcGxheS9kYy9ncGlvL2h3X2ZhY3Rvcnk6IERlbGV0ZSB1bnVz
ZWQgZnVuY3Rpb24KICAgICdkYWxfaHdfZmFjdG9yeV9kZXN0cm95JwoKIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9paC5jICAgICAgICB8ICAgMiArCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS92ZWdhMjBfaWguYyAgICAgICAgfCAgIDUgKy0KIC4uLi9hbWQvZGlzcGxheS9h
bWRncHVfZG0vYW1kZ3B1X2RtX2RlYnVnZnMuYyB8ICAgNCArLQogLi4uL2RybS9hbWQvZGlzcGxh
eS9kYy9iYXNpY3MvY29udmVyc2lvbi5jICAgIHwgICA5ICstCiAuLi4vZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9iaW9zL2Jpb3NfcGFyc2VyLmMgfCAxMTkgKysrKystLS0tLQogLi4uL2RybS9hbWQv
ZGlzcGxheS9kYy9iaW9zL2Jpb3NfcGFyc2VyMi5jICAgIHwgIDI5ICsrLQogLi4uL2RybS9hbWQv
ZGlzcGxheS9kYy9iaW9zL2NvbW1hbmRfdGFibGUuYyAgIHwgIDE2ICstCiAuLi4vZGlzcGxheS9k
Yy9iaW9zL2NvbW1hbmRfdGFibGVfaGVscGVyLmMgICAgfCAgMjAgKy0KIC4uLi9kaXNwbGF5L2Rj
L2Jpb3MvY29tbWFuZF90YWJsZV9oZWxwZXIyLmMgICB8ICAyMCArLQogLi4uL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvY2FsY3MvZGNlX2NhbGNzLmMgIHwgICA4ICstCiAuLi4vZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY2UvZGNlX2F1ZGlvLmMgICAgfCAgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY2UvZGNlX2F1eC5jICB8ICAgNiAtCiAuLi4vZHJtL2FtZC9kaXNwbGF5
L2RjL2RjZS9kY2VfY2xvY2tfc291cmNlLmMgfCAgNTcgKysrLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY2UvZGNlX2RtY3UuYyB8ICAgNiArLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjZS9kY2VfZG1jdS5oIHwgICAyIC0KIC4uLi9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjZS9kY2VfaTJjX2h3LmMgICB8ICAgNCArLQogLi4uL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNlL2RjZV9pMmNfc3cuYyAgIHwgICA5ICstCiAuLi4vZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjZS9kY2VfbGlua19lbmNvZGVyLmMgfCAgIDYgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kY2UvZGNlX29wcC5jICB8ICAgOCArLQogLi4uL2RybS9hbWQvZGlzcGxheS9kYy9k
Y2UvZGNlX3BhbmVsX2NudGwuYyAgIHwgICA4ICstCiAuLi4vYW1kL2Rpc3BsYXkvZGMvZGNlL2Rj
ZV9zdHJlYW1fZW5jb2Rlci5jICAgfCAgIDMgKy0KIC4uLi9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNl
L2RjZV90cmFuc2Zvcm0uYyAgICB8ICAxMyAtLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjZS9kbXViX3Bzci5jIHwgIDIyICstCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9n
cGlvL2h3X2ZhY3RvcnkuYyAgfCAgMTQgLS0KIC4uLi9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkv
aHdtZ3IvaHdtZ3IuYyAgICB8ICAgMiArLQogLi4uL2RybS9hbWQvcG0vcG93ZXJwbGF5L2h3bWdy
L3BwYXRvbWN0cmwuYyAgIHwgICA0ICstCiAuLi4vcG93ZXJwbGF5L2h3bWdyL3Byb2Nlc3NfcHB0
YWJsZXNfdjFfMC5jICAgfCAgIDEgKwogLi4uL2RybS9hbWQvcG0vcG93ZXJwbGF5L2h3bWdyL3Nt
dTdfaHdtZ3IuYyAgIHwgICA0ICstCiAuLi4vZHJtL2FtZC9wbS9wb3dlcnBsYXkvaHdtZ3IvdmVn
YTEwX2h3bWdyLmMgfCAxMzcgKysrKysrLS0tLS0tCiAuLi4vZHJtL2FtZC9wbS9wb3dlcnBsYXkv
aHdtZ3IvdmVnYTEwX2h3bWdyLmggfCAgIDEgKwogLi4uL2RybS9hbWQvcG0vcG93ZXJwbGF5L2h3
bWdyL3ZlZ2ExMl9od21nci5jIHwgIDExICstCiAuLi4vZHJtL2FtZC9wbS9wb3dlcnBsYXkvaHdt
Z3IvdmVnYTIwX2h3bWdyLmMgfCAgMTEgKy0KIGRyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfZGlz
cGxheS5jICAgICAgICAgICB8ICAgMyAtCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1
MC9kaXNwLmMgICAgICAgfCAgIDMgKy0KIC4uLi9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYv
Ymlvcy9pbml0LmMgICB8IDIwNCArKysrKystLS0tLS0tLS0tLS0KIC4uLi9ncHUvZHJtL25vdXZl
YXUvbnZrbS9zdWJkZXYvdm9sdC9nazIwYS5jICB8ICAgNCArLQogaW5jbHVkZS9kcm0vZHJtX2F0
b21pYy5oICAgICAgICAgICAgICAgICAgICAgIHwgICAzICstCiAzNyBmaWxlcyBjaGFuZ2VkLCAz
MjUgaW5zZXJ0aW9ucygrKSwgNDU1IGRlbGV0aW9ucygtKQoKQ2M6IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
CkNjOiBBbnRob255IEtvbyA8QW50aG9ueS5Lb29AYW1kLmNvbT4KQ2M6IEJlbiBTa2VnZ3MgPGJz
a2VnZ3NAcmVkaGF0LmNvbT4KQ2M6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVldC5MYWto
YUBhbWQuY29tPgpDYzogQ2hhcmxlbmUgTGl1IDxDaGFybGVuZS5MaXVAYW1kLmNvbT4KQ2M6ICJD
aHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4Lmll
PgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogRXJpYyBCZXJuc3RlaW4g
PGVyaWMuYmVybnN0ZWluQGFtZC5jb20+CkNjOiBFcnlrIEJyb2wgPGVyeWsuYnJvbEBhbWQuY29t
PgpDYzogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KQ2M6IEZlaWZlaSBYdSA8RmVpZmVp
Llh1QGFtZC5jb20+CkNjOiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4K
Q2M6IGZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IEdlb3JnZSBTaGVuIDxnZW9y
Z2Uuc2hlbkBhbWQuY29tPgpDYzogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5j
b20+CkNjOiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+CkNjOiBJZ29yIEty
YXZjaGVua28gPElnb3IuS3JhdmNoZW5rb0BhbWQuY29tPgpDYzogS3J1bm9zbGF2IEtvdmFjIDxL
cnVub3NsYXYuS292YWNAYW1kLmNvbT4KQ2M6IEt1b2dlZSBIc2llaCA8a2hzaWVoQGNvZGVhdXJv
cmEub3JnPgpDYzogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KQ2M6IExlbyBMaSA8
c3VucGVuZy5saUBhbWQuY29tPgpDYzogTGV3aXMgSHVhbmcgPExld2lzLkh1YW5nQGFtZC5jb20+
CkNjOiBsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZwpDYzogTWFhcnRlbiBMYW5raG9yc3Qg
PG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KQ2M6IE1hdXJvIFJvc3NpIDxpc3Nv
ci5vcnVhbUBnbWFpbC5jb20+CkNjOiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+
CkNjOiBNaWtpdGEgTGlwc2tpIDxtaWtpdGEubGlwc2tpQGFtZC5jb20+CkNjOiBub3V2ZWF1QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogUWluZ2xhbmcgTWlhbyA8bWlhb3FpbmdsYW5nQGh1YXdl
aS5jb20+CkNjOiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFpbC5jb20+CkNjOiBTZWFuIFBhdWwg
PHNlYW5AcG9vcmx5LnJ1bj4KQ2M6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNl
LmRlPgpDYzogV3lhdHQgV29vZCA8d3lhdHQud29vZEBhbWQuY29tPgotLSAKMi4yNS4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxp
bmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
